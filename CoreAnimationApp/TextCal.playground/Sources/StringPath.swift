import Foundation
import UIKit

public struct PathAttributeStringInfo {
  
  public let path: CGPath?
  public let attributeString: NSAttributedString
//  public let position: CGPoint
  public let emoji: Bool
  public let emojiRect: CGRect?
  
}

public func pathForAttrbuteStringBy(attributeString: NSAttributedString, options: NSStringEnumerationOptions) {
  
  let str = attributeString.string as NSString
  str.enumerateSubstringsInRange(NSMakeRange(0, str.length), options: options) { (subString, subStringRange, enclosedRange, stop) -> Void in
    
  }
  
  
}

public func pathForLettersAttribueString(attributeString: NSAttributedString) -> [PathAttributeStringInfo] {
  var pathInfos = [PathAttributeStringInfo]()
  let line = CTLineCreateWithAttributedString(attributeString)
  let runs = CTLineGetGlyphRuns(line)
  let runCount = CFArrayGetCount(runs)
  
  for i in 0..<runCount {
    
    let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, i), CTRun.self)
    let attributes = CTRunGetAttributes(run)
    let runFont = unsafeBitCast(CFDictionaryGetValue(attributes, unsafeAddressOf(kCTFontAttributeName)), CTFont.self)
    let stringRange = CTRunGetStringRange(run)
    let subString = attributeString.attributedSubstringFromRange(NSMakeRange(stringRange.location, stringRange.length))
    
    let symboltraint = CTFontGetSymbolicTraits(runFont)
    
    // 2. get glyphs and associate postions in each run
    let glyphCount = CTRunGetGlyphCount(run)
    var glyphs = Array(count: glyphCount, repeatedValue: CGGlyph())
    var positions = Array(count: glyphCount, repeatedValue: CGPoint())
    CTRunGetGlyphs(run, CFRangeMake(0, glyphCount), &glyphs)
    CTRunGetPositions(run, CFRangeMake(0, glyphCount), &positions)
    
    for j in 0..<glyphCount {

      var paths: CGMutablePath?
      var rect: CGRect?
      var emojiable = false
      
      let glyph = glyphs[j]
      let position = positions[j]
      
      if let pa = CTFontCreatePathForGlyph(runFont, glyph, nil) {
        // 
//        print("Text")
        let imageBound = CTRunGetImageBounds(run, nil, CFRangeMake(j, 1))
        paths = paths ?? CGPathCreateMutable()
        rect = rect ?? CGRect(origin: position, size: CGSize(width: 0, height: imageBound.height))
        rect!.size.width += imageBound.width
        var transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, -1.0), CGAffineTransformMakeTranslation(0, rect!.size.height))
        CGPathAddPath(paths, &transform, pa)
        
      } else {
        if symboltraint != CTFontSymbolicTraits(rawValue: 3221234688) {
          continue
        }
        emojiable = true
        // color glyph
//        print("symboltraint = \(symboltraint),Emoji = \(subString.string), position = \(position)")
        var ascent: CGFloat = 0.0
        var descent: CGFloat = 0.0
        var leading: CGFloat = 0.0
        let typeboundWidth = CTRunGetTypographicBounds(run, CFRangeMake(j, 1), &ascent, &descent, &leading)
        print("ascent = \(descent)")
        let typeboundSize = CGSize(width: CGFloat(typeboundWidth), height: ascent + descent + leading)
        let imageBounds = CTRunGetImageBounds(run, nil, CFRangeMake(j, 1))
        let boundSize = typeboundSize
        paths = paths ?? CGPathCreateMutable()
        rect = rect ?? CGRect(origin: position, size: CGSize(width: 0, height: boundSize.height))
        rect!.size.width += boundSize.width
//        let colorGlyphPath = CGPathCreateWithRect(CGRect(origin: CGPointZero, size: imageBounds.size), nil)
//        var transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(position.x, position.y), CGAffineTransformMakeScale(1.0, -1.0))
//        CGPathAddPath(paths, &transform, nil)
      }
//      let sub = subString.attributedSubstringFromRange(NSMakeRange(j, glyphCount))
      if let paths = paths {
        let runPaths = CGPathCreateCopy(paths)
        let info = PathAttributeStringInfo(path: runPaths!, attributeString: subString, emoji: emojiable, emojiRect: rect)
        pathInfos.append(info)
      }
    }
    
    
  }
  
  return pathInfos
}

public func pathForLineAttributeString(attributeString: NSAttributedString) -> [PathAttributeStringInfo] {
  
  var pathInfos = [PathAttributeStringInfo]()
  
  var paths: CGMutablePath?
  
  let line = CTLineCreateWithAttributedString(attributeString)
  let runs = CTLineGetGlyphRuns(line)
  let runsCount = CFArrayGetCount(runs)
  
  for i in 0..<runsCount {
    
    // 1. get each run
    let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, i), CTRunRef.self)
    let runAttributes = CTRunGetAttributes(run)
    let runFont = unsafeBitCast(CFDictionaryGetValue(runAttributes, unsafeAddressOf(kCTFontAttributeName)), CTFontRef.self)
    let symbolTrait = CTFontGetSymbolicTraits(runFont)
    
//    let ColorGlyphAvaliable = (symbolTrait == .ColorGlyphsTrait) //check whether Color glyph
    let stringRange = CTRunGetStringRange(run)
    
    let subString = attributeString.attributedSubstringFromRange(NSMakeRange(stringRange.location, stringRange.length)) //
    
    // 2. get glyphs and associate postions in each run
    let glyphCount = CTRunGetGlyphCount(run)
    var glyphs = Array(count: glyphCount, repeatedValue: CGGlyph())
    var positions = Array(count: glyphCount, repeatedValue: CGPoint())
    CTRunGetGlyphs(run, CFRangeMake(0, glyphCount), &glyphs)
    CTRunGetPositions(run, CFRangeMake(0, glyphCount), &positions)
//    print("symbolTrait = \(symbolTrait) glyphCount = \(CTFontSymbolicTraits.ColorGlyphsTrait)" )
//    if case CTFontSymbolicTraits.ColorGlyphsTrait = symbolTrait {
//    
//      let imageBounds = CTRunGetImageBounds(run, nil, CFRangeMake(0, glyphCount))
//      var transform = CGAffineTransformMakeTranslation(positions[0].x, positions[0].y)
//      let colorGlyphPath = CGPathCreateWithRect(CGRect(origin: CGPointZero, size: imageBounds.size), nil)
//      CGPathAddPath(paths, &transform, colorGlyphPath)
//    
//    }
//    else {
    var colorGlyphs: CGMutablePath?
    var colorGlyphsRect: CGRect?
      for j in 0..<glyphCount {
        let glyph = glyphs[j]
        let postion = positions[j]
        
          // 3. create path for each glyph
          if let glyphPath = CTFontCreatePathForGlyph(runFont, glyph, nil) {
            paths = paths ?? CGPathCreateMutable()
            var transform = CGAffineTransformMakeTranslation(postion.x, postion.y)
            CGPathAddPath(paths, &transform, glyphPath)
          } else {
            // color glyph
            let imageBounds = CTRunGetImageBounds(run, nil, CFRangeMake(j, 1))
            colorGlyphs = colorGlyphs ?? CGPathCreateMutable()
            colorGlyphsRect = colorGlyphsRect ?? CGRect(origin: positions[0], size: CGSize(width: 0, height: imageBounds.size.height))
            colorGlyphsRect!.size.width += imageBounds.size.width
            let colorGlyphPath = CGPathCreateWithRect(CGRect(origin: CGPointZero, size: imageBounds.size), nil)
            var transform = CGAffineTransformMakeTranslation(postion.x, postion.y)
            CGPathAddPath(colorGlyphs, &transform, colorGlyphPath)
          }
      }
    
    if let colorGlyphs = colorGlyphs {
      let info = PathAttributeStringInfo(path: colorGlyphs, attributeString: subString, emoji: true, emojiRect: colorGlyphsRect!)
      pathInfos.append(info)
    }
//    }
  }
  
  if let paths = paths {
    let finalPath = CGPathCreateCopy(paths)
    let info = PathAttributeStringInfo(path: finalPath, attributeString: attributeString, emoji: false, emojiRect: nil)
    pathInfos.append(info)
  }
  
  return pathInfos
}

//func pathForCharacterWithAttributeString(attributeString: NSAttributedString) -> 
