//
//  ViewController.swift
//  CoreAnimationApp
//
//  Created by Emiaostein on 11/2/15.
//  Copyright © 2015 Emiaostein. All rights reserved.
//

import UIKit

public struct ssss {
  
  let bbb: String
}

class ViewController: UIViewController {
  
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var animationView: AnimationView!
  var layers = [String: CALayer]()

  override func viewDidLoad() {
    super.viewDidLoad()
    textView.textContainer.lineFragmentPadding = 0.0
//    textView.textContainer.exclusionPaths = exclusionPaths ?? []
    textView.textContainerInset = UIEdgeInsetsZero
    textView.attributedText = demoString()
    textView.bounds.size = textView.contentSize
    textView.hidden = true
    
    textView.showLinefragments()
    
    let lines = textView.layoutManager.lineFragmentUesedRectsAndEffctiveAttributteStrings()
    
    animationView.lines = lines
    animationView.frame = textView.frame
    animationView.setupLayers()
  }
  @IBAction func tapAction(sender: UITapGestureRecognizer) {
    
    animationView.removeAllAnimations()
    animationView.addFadeAnimation()
  }
  @IBAction func switchAction(sender: UISwitch) {
    
//    animationView.layer.drawsAsynchronously = sender.on
  }
  
  override func viewDidAppear(animated: Bool) {
    animationView.layer.drawsAsynchronously = true
    animationView.addFadeAnimation()
    
    
  }
  
  
  func demoString() -> NSAttributedString
  {
    // Create the attributed string
    let demoString = NSMutableAttributedString(string:"Welcome to 💻💻Attribu🐱d String Creator\n\nSimply paste, write or import any kind of text into this 💻sdarea and the code to make an NSMutableAtrributedString for it will be generated below; 🐱🐱along with all of its font, colour and paragraph form🐱ting. \n\nSelect a name for your variable in the top left corner, copy the code i🐱o your IDE a🐱 assign it.\n\nThan🐱 For ouing Attributed 🐱ring Creator")
    
    // Declare the fonts
    let demoStringFont1 = UIFont(name:"AvenirNext-Regular", size:24.0)
    let demoStringFont2 = UIFont(name:"Helvetica", size:12.0)
    let demoStringFont3 = UIFont(name:"Avenir-Book", size:12.0)
    let demoStringFont4 = UIFont(name:"TimesNewRomanPSMT", size:12.0)
    let demoStringFont5 = UIFont(name:"Zapfino", size:20.0)
    
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
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

