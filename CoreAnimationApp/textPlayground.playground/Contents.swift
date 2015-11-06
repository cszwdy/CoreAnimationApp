//: Playground - noun: a place where people can play

//
//  Calculator.swift
//  CoreAnimationApp
//
//  Created by Emiaostein on 11/3/15.
//  Copyright © 2015 Emiaostein. All rights reserved.
//

import Foundation
import UIKit

enum TextSpliteTyple {
  case Default, Line, Characters
}

struct TextMetaData {
  
  var str: String
  var rect: CGRect
  var insets: UIEdgeInsets
  var attributes: [String: AnyObject]
  var font: [String: AnyObject]
  
}

extension TextMetaData {
  
  func spliteTextBy(typle: TextSpliteTyple) -> [TextMetaData] {
    switch typle {
    case .Line:
      return spliteTextByLine()
    case .Characters:
      return spliteTextByCharacters()
    default:
      return [TextMetaData(str: self.str, rect: self.rect, insets: self.insets, attributes: self.attributes, font: self.font)]
    }
  }
  
  private func spliteTextByLine() -> [TextMetaData] {
    
    return [TextMetaData]()
  }
  
  private func spliteTextByCharacters() -> [TextMetaData] {
    
    let textStorage = NSTextStorage(string: str, attributes: attributes)
    let layoutManager = NSLayoutManager()
    let container = NSTextContainer(size: rect.size)
    
    layoutManager.addTextContainer(container)
    textStorage.addLayoutManager(layoutManager)
    
    let len = textStorage.length
    
    //1. per character rect
    let fontName = font["fontName"] as! String
    let fontSize = font["fontSize"] as! CGFloat
//    let ctf = CTFontCreateWithName(fontName, fontSize, nil)
//    let d: [String: AnyObject] = [(kCTFontAttributeName as String): ctf, (kCTLigatureAttributeName as String): NSNumber(integer: 2)]
//    let des = CTFontDescriptorCreateWithAttributes((d as CFDictionaryRef))
//    let fontdescriptor = CTFontCreateWithFontDescriptor(des, fontSize, nil)
    let fontdescriptor = CTFontCreateWithName(fontName, fontSize, nil)
    let s = str
    
    var glyphs = Array(count: len, repeatedValue: CGGlyph())
    var characters = Array(count: len, repeatedValue: UniChar())
    var rects = Array(count: len, repeatedValue: CGRect())
    
    CFStringGetCharacters(s, CFRangeMake(0, len), &characters)
    //
    CTFontGetGlyphsForCharacters(fontdescriptor, &characters, &glyphs, len)
    //
    CTFontGetBoundingRectsForGlyphs(fontdescriptor, .Horizontal, &glyphs, &rects, len)
    //
    let shaperView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    glyphs.count
    for (i,glyph) in glyphs.enumerate() {
      
      let aapath = CTFontCreatePathForGlyph(fontdescriptor, glyph, nil)
      
//      CTRun
      var transform = CGAffineTransformMakeScale(1, -1)
      
      let nextPath = CGPathCreateCopyByTransformingPath(aapath, &transform)
      let shaper = CAShapeLayer()
      shaper.frame = CGRect(x:100 + i * 20, y: 100, width: 50, height: 50)
      shaper.path = nextPath
    
      shaperView.layer.addSublayer(shaper)
      shaperView
    }
    
    var fitrange = CFRange()
    let framesetter = CTFramesetterCreateWithAttributedString(NSAttributedString(string: s as String, attributes: attributes))
    let framesize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, len), nil, CGSize(width: CGRectGetWidth(rect), height: CGFloat.max), &fitrange)
    let frameRect = CGRect(origin: CGPoint(x: 0, y: 0), size: framesize)
    
    let path = CGPathCreateWithRect(frameRect, nil)
    
    let ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, len), path, nil)
    
    
    // lines
    let lines = CTFrameGetLines(ctFrame)
    let lineCount = (lines as Array).count
    var linesOrigin = Array(count: lineCount, repeatedValue: CGPoint())
    var lineFrame = Array(count: lineCount, repeatedValue: CGRect())
    let line = (lines as Array)[0]
    let aaa = CTLineGetGlyphCount(line as! CTLine)
    let bbb = CTLineGetGlyphRuns(line as! CTLine)
    let run = (bbb as Array)[0] as! CTRun
    CTRunGetGlyphCount(run)
    var runglyphs = Array(count: aaa, repeatedValue: CGGlyph())
    let ss = CTRunGetGlyphs(run, CFRangeMake(0, aaa), &runglyphs)
    print(runglyphs)
    let ashaperView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    for (i,aglyph) in runglyphs.enumerate() {
      
      let aapath = CTFontCreatePathForGlyph(fontdescriptor, aglyph, nil)
      
      //      CTRun
      var transform = CGAffineTransformMakeScale(1, -1)
      
      let nextPath = CGPathCreateCopyByTransformingPath(aapath, &transform)
      let shaper = CAShapeLayer()
      shaper.frame = CGRect(x:100 + i * i * 20, y: 100, width: 50, height: 50)
      shaper.path = nextPath
      
      ashaperView.layer.addSublayer(shaper)
    }
    
    ashaperView
    
    
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), &linesOrigin) // get per line's origin
    
    for i in 0..<lineCount {
      
      let line = (lines as Array)[i]
//      let aaa = CTLineGetGlyphCount(line as! CTLine)
//      let bbb = CTLineGetGlyphRuns(line as! CTLine)
      let lineRange = CTLineGetStringRange(line as! CTLine)
      let lineStartIndex = lineRange.location
      let lineEndIndex = lineStartIndex + lineRange.length
      
      let lineOrigin = linesOrigin[i]
      var ascent: CGFloat = 0
      var descent: CGFloat = 0
      var leading: CGFloat = 0
      let lineWidth = CTLineGetTypographicBounds(line as! CTLine, &ascent, &descent, &leading)
      
      let useRealHeight = i < lineCount - 1
      let neighborLineY = i > 0 ? linesOrigin[i - 1].y : (lineCount - 1 > i ? linesOrigin[i + 1].y : 0.0)
      let lineHeight = ceil(useRealHeight ? abs(neighborLineY - lineOrigin.y) : ascent + descent + leading)
      
      lineFrame[i].origin = lineOrigin
      lineFrame[i].size = CGSize(width: CGFloat(lineWidth), height: lineHeight)
      
      
      for i in lineStartIndex..<lineEndIndex {
        let startoffset = CTLineGetOffsetForStringIndex(line as! CTLine, i, nil)
        rects[i].origin.x += startoffset
        rects[i].origin.y += lineOrigin.y
        
       let r = CGRectApplyAffineTransform(rects[i], CGAffineTransformMakeScale(1, -1))
        rects[i] = r
      }
    }
    
    //2. combine the ligature characters and output
    var texts = [TextMetaData]()
    var nextLocation = 0
    
    for i in 0..<len {
      
      if i < nextLocation {
        continue
      }
      
      let testGlyphRange = NSMakeRange(nextLocation, 1)
      //      let testCharRange = NSMakeRange(nextLocation, 1)
      
      //      var actualCharRange = NSMakeRange(0, 0)
      var actualGlyphRange = NSMakeRange(0, 0)
      
      //      let glyphRange =   layoutManager.glyphRangeForCharacterRange(testCharRange, actualCharacterRange: &actualCharRange)
      let charRange = layoutManager.characterRangeForGlyphRange(testGlyphRange, actualGlyphRange: &actualGlyphRange)
      
      print(actualGlyphRange)
      
      let sub = (str as NSString).substringWithRange(charRange)
      
      //      print(len)
      //      print(rects.count)
      print(charRange)
      
      let subRects = rects[charRange.location..<(charRange.location + charRange.length)]
      
      print(subRects)
      
      
      // TODO: combine the ligature character rects -- Emiaostein; 2015-11-03-15:59
      let rect = subRects.count == 1 ? subRects[charRange.location] : subRects.reduce(subRects[charRange.location], combine: { (preRect: CGRect, currentRect) -> CGRect in
        CGRectUnion(preRect, currentRect)
      })
      
      print(rect)
      //      let rect = CGRectZero
      
      let text = TextMetaData(str: sub, rect: rect, insets: UIEdgeInsetsZero, attributes: attributes, font: font)
      texts.append(text)
      nextLocation = charRange.length + charRange.location
    }
    
    return texts
  }
}

let fontNa = "Zapfino"// Zapfino, Helvetica


let view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 300)))

let font = UIFont(name: fontNa, size: 24)!

let shadow = NSShadow()
shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
shadow.shadowOffset = CGSizeMake(20.1, 20.1)
shadow.shadowBlurRadius = 1

let attributes = [
  NSFontAttributeName: font,
  NSForegroundColorAttributeName: UIColor.blueColor().colorWithAlphaComponent(1),
  //      NSShadowAttributeName: shadow,
  //      NSKernAttributeName: 10,
        NSLigatureAttributeName: 1
]

let textStr = TextMetaData(str: "fou", rect: view.bounds, insets: UIEdgeInsetsZero, attributes: attributes, font: ["fontName": fontNa, "fontSize": 24.0])

let lineheight = ("Leg" as NSString).sizeWithAttributes(attributes).height
let texts = textStr.spliteTextBy(.Characters)

let layer = CALayer()
layer.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
layer.backgroundColor = UIColor.blackColor().CGColor
for (i, text) in texts.enumerate() {
  //      if i == 0 {
  //        continue
  //      }
  text
  UIGraphicsBeginImageContext(text.rect.size)
  (text.str as NSString).drawInRect(CGRect(origin: CGPointZero, size: text.rect.size), withAttributes: text.attributes)
  let textImage = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
  
  print(text.rect)
  let textLayer = CATextLayer()
  textLayer.frame = CGRectMake(text.rect.origin.x + CGFloat(50 * i) + 50, 0 + 100, CGRectGetWidth(text.rect) + 2, lineheight)
//  textLayer.backgroundColor = UIColor(red: CGFloat(random() % 255) / 255.0, green: CGFloat(random() % 255) / 255.0, blue: CGFloat(random() % 255) / 255.0, alpha: 1).CGColor
  textLayer.masksToBounds = false
  textLayer.backgroundColor = UIColor.blueColor().CGColor
//  textLayer.contents = textImage
//  textLayer.alignmentMode = kCAAlignmentCenter
//  textLayer.contentsScale = 1
  textLayer.string = text.str
  textLayer.font = fontNa
  textLayer.fontSize = 24
  layer.addSublayer(textLayer)
}

view.layer.addSublayer(layer)



view
