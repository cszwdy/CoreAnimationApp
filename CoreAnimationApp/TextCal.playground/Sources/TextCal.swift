import Foundation
import UIKit

public extension String {
  func size(withAttributes attrs: [String:AnyObject], constrainedTo box: CGSize, exclusionPath: [UIBezierPath]?) -> CGRect {
    let storage = NSTextStorage(string: self)
    let container = NSTextContainer(size: CGSize(width: box.width, height: box.height))
    let layout = NSLayoutManager()
    container.lineFragmentPadding = 0.0
    container.exclusionPaths = exclusionPath ?? []
    storage.addAttributes(attrs, range: NSMakeRange(0, storage.length))
    layout.addTextContainer(container)
    storage.addLayoutManager(layout)

//    layout.ensureLayoutForTextContainer(container)
//    let _ = layout.glyphRangeForTextContainer(container)
    return layout.usedRectForTextContainer(container)
  }
}

public extension NSLayoutManager {
  
  func lineFragmentUesedRectsAndEffctiveAttributteStrings() -> ([(CGRect, NSAttributedString, CGPoint)]) {
    
    guard let storage = self.textStorage else {
      return []
    }
    
    var lines = [(CGRect, NSAttributedString, CGPoint)]()
    let len = storage.length
    var nextGlyphIndex = 0
    
    for i in 0..<len {
      if i < nextGlyphIndex {
        continue
      }
      var effctiveGlyphRange = NSMakeRange(0, 0)
//      let linef = lineFragmentRectForGlyphAtIndex(nextGlyphIndex, effectiveRange: nil)
      let line = lineFragmentUsedRectForGlyphAtIndex(nextGlyphIndex, effectiveRange: &effctiveGlyphRange)
//      let line = CGRect(origin: CGPoint(x: lineuf.origin.x, y: -lineuf.origin.y + (linef.size.height - lineuf.size.height) / 2.0), size: lineuf.size)
      let subString = storage.attributedSubstringFromRange(effctiveGlyphRange)
      let location = locationForGlyphAtIndex(nextGlyphIndex)
      nextGlyphIndex = effctiveGlyphRange.location + effctiveGlyphRange.length
      
      let item = (line, subString, location)
      lines.append(item)
    }
    
    return lines
  }
  
  func lineFragments() -> [CGRect] {
    
    guard let storage = self.textStorage else {
      return []
    }
    
    var lines = [CGRect]()
    let len = storage.length
    var nextGlyphIndex = 0
    
    for i in 0..<len {
      if i < nextGlyphIndex {
        continue
      }
      var effctiveGlyphRange = NSMakeRange(0, 0)
      let line = self.lineFragmentUsedRectForGlyphAtIndex(nextGlyphIndex, effectiveRange: &effctiveGlyphRange)
      nextGlyphIndex = effctiveGlyphRange.location + effctiveGlyphRange.length
      lines.append(line)
    }

    return lines
  }
  
  func lineAttributeStrings() -> [NSAttributedString] {
    guard let storage = self.textStorage else {
      return []
    }
    
    var lines = [NSAttributedString]()
    let len = storage.length
    var nextGlyphIndex = 0
    
    for i in 0..<len {
      if i < nextGlyphIndex {
        continue
      }
      var effctiveGlyphRange = NSMakeRange(0, 0)
      lineFragmentRectForGlyphAtIndex(nextGlyphIndex, effectiveRange: &effctiveGlyphRange)
      let subString = storage.attributedSubstringFromRange(effctiveGlyphRange)
      nextGlyphIndex = effctiveGlyphRange.location + effctiveGlyphRange.length
      lines.append(subString)
    }
    
    return lines
  }
}

