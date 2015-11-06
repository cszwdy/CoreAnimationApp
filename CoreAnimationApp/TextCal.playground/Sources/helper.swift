import Foundation
import UIKit

public extension UITextView {
  
  func showLinefragments() {
    
    let lines = layoutManager.lineFragments()
    
    for line in lines {
      
      let alayer = CALayer()
      alayer.frame = line
      alayer.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.3).CGColor
      layer.addSublayer(alayer)
    }
  }
}

public func setupTextView(string: String, attributes: [String: AnyObject], exclusionPaths: [UIBezierPath]?) -> UITextView {
  
  let str = string
  let att = attributes
  
  let attrString = NSAttributedString(string: str, attributes: att)
  let textSize = str.size(withAttributes: att, constrainedTo: CGSize(width: CGFloat.max, height: CGFloat.max), exclusionPath: nil).size
  
  let textView = UITextView(frame: CGRect(origin: CGPointZero, size: textSize))
  textView.textContainer.lineFragmentPadding = 0.0
  textView.textContainer.exclusionPaths = exclusionPaths ?? []
  textView.textContainerInset = UIEdgeInsetsZero
  textView.attributedText = attrString
  return textView
}