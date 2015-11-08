//: Playground - noun: a place where people can play

import UIKit

let str = str18
let font = fontDL
let att = [NSFontAttributeName: font]

func demoString() -> NSAttributedString
{
  // Create the attributed string
  let demoString = NSMutableAttributedString(string:"Welcome to 🐱🐱Attributed String Creator\n\nSimply paste, write or import any kind of text into this 🐱🐱area and the code to make an NSMutableAtrributedString for it will be generated below; 🐱🐱along with all of its font, colour and paragraph formatting. \n\nSelect a name for your variable in the top left corner, copy the code into your IDE and assign it.\n\nThanks For Using Attributed String Creator")
  
  // Declare the fonts
  let demoStringFont1 = UIFont(name:"AvenirNext-Regular", size:24.0)
  let demoStringFont2 = UIFont(name:"Helvetica", size:12.0)
  let demoStringFont3 = UIFont(name:"Avenir-Book", size:12.0)
  let demoStringFont4 = UIFont(name:"TimesNewRomanPSMT", size:12.0)
  let demoStringFont5 = UIFont(name:"Zapfino", size:12.0)
  
  // Declare the colors
  let demoStringColor1 = UIColor(red: 0.292745, green: 0.461693, blue: 0.998524, alpha: 1.000000)
  let demoStringColor2 = UIColor(red: 0.000000, green: 0.000000, blue: 0.000000, alpha: 1.000000)
  let demoStringColor3 = UIColor(red: 0.320477, green: 0.000000, blue: 0.478882, alpha: 1.000000)
  let demoStringColor4 = UIColor(red: 0.060450, green: 0.490443, blue: 0.763762, alpha: 1.000000)
  
  // Declare the paragraph styles
  let demoStringParaStyle1 = NSMutableParagraphStyle()
  demoStringParaStyle1.alignment = NSTextAlignment.Center
  demoStringParaStyle1.tabStops = [
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 28.000000, options:
      [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 56.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 84.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 112.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 140.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 168.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 196.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 224.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 252.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 280.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 308.000000, options: [String: AnyObject]()),
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 336.000000, options: [String: AnyObject]())]
  
  
  // Create the attributes and add them to the string
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(0,36))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont1!, range:NSMakeRange(0,36))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(0,36))
  demoString.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(0,36))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(36,1))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont1!, range:NSMakeRange(36,1))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(36,1))
  demoString.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(36,1))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(37,1))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(37,1))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont2!, range:NSMakeRange(37,1))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(38,86))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(38,86))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(38,86))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(124,25))
  demoString.addAttribute(NSForegroundColorAttributeName, value:demoStringColor3, range:NSMakeRange(124,25))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(124,25))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(124,25))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(149,55))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(149,55))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(149,55))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(204,4))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(204,4))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont4!, range:NSMakeRange(204,4))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(208,2))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(208,2))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(208,2))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(210,6))
  demoString.addAttribute(NSForegroundColorAttributeName, value:demoStringColor4, range:NSMakeRange(210,6))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(210,6))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(210,6))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(216,128))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(216,128))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(216,128))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(344,1))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(344,1))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont2!, range:NSMakeRange(344,1))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor2, range:NSMakeRange(345,42))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(345,42))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont5!, range:NSMakeRange(345,42))
  
  return NSAttributedString(attributedString:demoString)
}

let textView = setupTextView(str, attributes: att, exclusionPaths: nil)

textView.textAlignment = .Center
//textView.attributedText = demoString()
textView.frame.size = textView.contentSize
//let exclusionPath = UIBezierPath(rect: CGRect(x: 20, y: 0, width: 100, height: 10))
//let exclusionPath2 = UIBezierPath(rect: CGRect(x: 200, y: 0, width: 100, height: 100))
//textView.textContainer.heightTracksTextView = true
//textView.textContainer.widthTracksTextView = true
//textView.textContainer.exclusionPaths = [exclusionPath2, exclusionPath]
//
//let size = str.size(withAttributes: att, constrainedTo: CGSize(width: CGFloat.max, height: CGFloat.max), exclusionPath: [exclusionPath, exclusionPath2]).size
//textView.bounds.size = size
textView.showLinefragments()
let lines = textView.layoutManager.lineFragmentUesedRectsAndEffctiveAttributteStrings()


for (i, lineInfo) in lines.enumerate() {
  let rect = lineInfo.0
  let attr = lineInfo.1
  let origin = lineInfo.2
  
  let shapeLayer = CALayer()
//  shapeLayer.backgroundColor = UIColor.blackColor().CGColor
  shapeLayer.geometryFlipped = true
  shapeLayer.frame = rect
  let pathInfos = pathForLettersAttribueString(attr)
  
  for (i, pathInfo) in pathInfos.enumerate() {
    if pathInfo.emoji {
      let emojiLayer = CATextLayer()
      //      emojiLayer.geometryFlipped = true
      emojiLayer.frame = pathInfo.emojiRect!
      emojiLayer.backgroundColor = UIColor.redColor().CGColor
      emojiLayer.frame.origin.y += CGRectGetHeight(rect) - origin.y
      emojiLayer.string = pathInfo.attributeString
      shapeLayer.addSublayer(emojiLayer)
      
    } else {
      
      let textShapeLayer = CAShapeLayer()
//      textShapeLayer.backgroundColor = UIColor.yellowColor().CGColor
      textShapeLayer.fillColor = UIColor.blueColor().CGColor
      textShapeLayer.frame = pathInfo.emojiRect!
      textShapeLayer.frame.origin.y += CGRectGetHeight(rect) - origin.y
//      var transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(rect) - origin.y)
//      let fixPath = CGPathCreateCopyByTransformingPath(pathInfo.path, &transform)
      textShapeLayer.path = pathInfo.path
      let path = UIBezierPath(CGPath: pathInfo.path!)
      shapeLayer.addSublayer(textShapeLayer)
//      let path = pathInfo.path
//      shapeLayer.fillColor = UIColor.redColor().CGColor
//      var transfrom = CGAffineTransformMakeTranslation(0, CGRectGetHeight(rect) - origin.y)
//      let fixPath = CGPathCreateCopyByTransformingPath(path, &transfrom)
//      shapeLayer.path = fixPath
//      textView.layer.addSublayer(shapeLayer)
    }
  }
  textView.layer.addSublayer(shapeLayer)
}
textView


// Line

//for (i, lineInfo) in lines.enumerate() {
//  let rect = lineInfo.0
//  let attr = lineInfo.1
//  let origin = lineInfo.2
//  
//  let shapeLayer = CAShapeLayer()
//  shapeLayer.geometryFlipped = true
//  shapeLayer.frame = rect
//  let pathInfos = pathForLineAttributeString(attr)
//  
//  for (i, pathInfo) in pathInfos.enumerate() {
//    if pathInfo.emoji {
//      let emojiLayer = CATextLayer()
////      emojiLayer.geometryFlipped = true
//      emojiLayer.frame = pathInfo.emojiRect!
//      emojiLayer.frame.origin.y += CGRectGetHeight(rect) - origin.y
//      emojiLayer.string = pathInfo.attributeString
//      shapeLayer.addSublayer(emojiLayer)
//      
//    } else {
//      let path = pathInfo.path
//      shapeLayer.fillColor = UIColor.redColor().CGColor
//      var transfrom = CGAffineTransformMakeTranslation(0, CGRectGetHeight(rect) - origin.y)
//      let fixPath = CGPathCreateCopyByTransformingPath(path, &transfrom)
//      shapeLayer.path = fixPath
//      textView.layer.addSublayer(shapeLayer)
//    }
//  }
//}
//
//textView











