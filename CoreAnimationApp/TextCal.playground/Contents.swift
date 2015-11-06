//: Playground - noun: a place where people can play

import UIKit

let str = str4
let font = fontSL
let att = [NSFontAttributeName: font]

let textView = setupTextView(str, attributes: att, exclusionPaths: nil)
textView.textAlignment = .Center
let exclusionPath = UIBezierPath(rect: CGRect(x: 20, y: 0, width: 100, height: 10))
let exclusionPath2 = UIBezierPath(rect: CGRect(x: 200, y: 0, width: 100, height: 100))
textView.textContainer.heightTracksTextView = true
textView.textContainer.widthTracksTextView = true
textView.textContainer.exclusionPaths = [exclusionPath2, exclusionPath]

let size = str.size(withAttributes: att, constrainedTo: CGSize(width: CGFloat.max, height: CGFloat.max), exclusionPath: [exclusionPath, exclusionPath2]).size
//textView.bounds.size = size
textView.showLinefragments()
let lines = textView.layoutManager.lineFragmentUesedRectsAndEffctiveAttributteStrings()
textView.layer.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.5).CGColor
//textView.transform = CGAffineTransformMakeRotation(45.0 * CGFloat(M_PI) / 180.0)
let canvas = CAShapeLayer()
canvas.frame = textView.bounds
for (i, item) in lines.enumerate() {
//  if i < 2 {
//    continue
//  }
  var rect = item.0
//  rect.origin.y -= 1
  let oldpath = pathForLineAttributeString(item.1)
  let location = item.2
  let boundingBox = CGPathGetBoundingBox(oldpath)
//  var transfrom = CGAffineTransformMakeTranslation(0, (rect.size.height - boundingBox.size.height) / 2.0 - boundingBox.origin.y)
  var transfrom = CGAffineTransformMakeTranslation(0, (rect.size.height - location.y))
  let path = CGPathCreateCopyByTransformingPath(oldpath, &transfrom)
//  let path = oldpath
  let shapeLayer = CAShapeLayer()
  shapeLayer.path = path
  shapeLayer.geometryFlipped = true
  shapeLayer.fillColor = UIColor.redColor().CGColor
  shapeLayer.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.5).CGColor
  
//  print(CGPathGetBoundingBox(path))
  print(location)
  print(rect)
  print(boundingBox)
  shapeLayer.frame = rect
//  shapeLayer.frame.size = boundingBox.size
//  shapeLayer.bounds = boundingBox
//  shapeLayer.frame = CGRect(origin: rect.origin, size: rect.size)
  let boundLayer = CALayer()
  boundLayer.backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.2).CGColor
  boundLayer.frame = CGRect(origin: CGPoint(x: rect.origin.x, y: rect.origin.y + (rect.size.height - boundingBox.size.height) / 2.0), size: boundingBox.size)
  textView.layer.addSublayer(shapeLayer)
  textView.layer.addSublayer(boundLayer)
//  canvas.addSublayer(shapeLayer)
}

textView

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = UIColor.blueColor()
let shap = CAShapeLayer()
shap.path = UIBezierPath(ovalInRect: view.bounds).CGPath
shap.fillColor = UIColor.redColor().CGColor
view.layer.addSublayer(shap)
view







