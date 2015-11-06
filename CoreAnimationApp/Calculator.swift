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
    
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), &linesOrigin) // get per line's origin
    
    for i in 0..<lineCount {
      
      let line = (lines as Array)[i]
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