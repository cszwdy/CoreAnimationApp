import Foundation
import UIKit

public struct pathForLineAttributeStringInfo {
  
  let path: CGPath?
  let attributeString: NSAttributedString
  let position: CGPoint
  let emoji: Bool
  
}

public func pathForLineAttributeString(attributeString: NSAttributedString) -> CGPath? {
  
  let paths = CGPathCreateMutable()
  
  let line = CTLineCreateWithAttributedString(attributeString)
  let runs = CTLineGetGlyphRuns(line)
  let runsCount = CFArrayGetCount(runs)
  
  for i in 0..<runsCount {
    
    let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, i), CTRunRef.self)
    let runAttributes = CTRunGetAttributes(run)
    let runFont = unsafeBitCast(CFDictionaryGetValue(runAttributes, unsafeAddressOf(kCTFontAttributeName)), CTFontRef.self)
    
    let glyphCount = CTRunGetGlyphCount(run)
    var glyphs = Array(count: glyphCount, repeatedValue: CGGlyph())
    var positions = Array(count: glyphCount, repeatedValue: CGPoint())
    CTRunGetGlyphs(run, CFRangeMake(0, glyphCount), &glyphs)
    CTRunGetPositions(run, CFRangeMake(0, glyphCount), &positions)

    for j in 0..<glyphCount {
      let glyph = glyphs[j]
      let postion = positions[j]

      let glyphPath = CTFontCreatePathForGlyph(runFont, glyph, nil)
      var transform = CGAffineTransformMakeTranslation(postion.x, postion.y)
      CGPathAddPath(paths, &transform, glyphPath)
    }
    
  }
//
//  let runs = unsafeBitCast(CTLineGetGlyphRuns(line), CTRun.self)
//
//  let arun = (runs as [CTRun])[0]
//  let runAttribute = CTRunGetAttributes(arun)
//  let aa = runAttribute[(kCTFontAttributeName as String)]
//  for run in runs {
//
//    let runAttribute = CTRunGetAttributes(run) as NSDictionary
//    let runFont = runAttribute[kCTFontAttributeName] as! CTFontRef
//    let runFont = runAttribute[(kCTFontAttributeName as String)] as! CTFont
//    let glyphsCount = CTRunGetGlyphCount(run)
//    let glyphs = unsafeBitCast(CTRunGetGlyphsPtr(run), Array<CGGlyph>.self)
//    let glyphPostions = unsafeBitCast(CTRunGetPositionsPtr(run), Array<CGPoint>.self)
//
//    for i in 0..<glyphsCount {
//      
//      let glyph = glyphs[i]
//      let postion = glyphPostions[i]
//
//      let glyphPath = CTFontCreatePathForGlyph(runFont, glyph, nil)
//      var transform = CGAffineTransformMakeTranslation(postion.x, postion.y)
//      CGPathAddPath(paths, &transform, glyphPath)
//    }
//  }
  
  let finalPath = CGPathCreateCopy(paths)
  
  return finalPath
}

//func pathForCharacterWithAttributeString(attributeString: NSAttributedString) -> 
