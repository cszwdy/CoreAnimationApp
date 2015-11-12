import Foundation
import UIKit
//无字， 中文, 西文, ,emoji, emoji位置（首，中，尾部，分开，相连）, emoji数量（1，2，3），换行（首，中，尾部，分开，相连), 字体， 空格
public let str0 = ""

public let str1 = "我的名字叫陈星宇"

public let str2 = "我的名字叫陈星宇, My name is Emiaostein"

public let str3 = "🐱我的名字叫陈星宇, M name is Emiaostein"

public let str4 = "我的名字叫陈🐱星宇, My name is Emiaostein"

public let str5 = "我的名字叫陈星宇, My name is Emiaostein🐱"

public let str6 = "🐱🐱我的名字叫陈星宇, My name is Emiaostein"

public let str7 = "我的名字叫陈🐱🐱星宇, My name is Emiaostein"

public let str8 = "我的名字叫陈星宇, My name is Emiaostein🐱🐱"

public let str9 = "🐱🐱🐱我的名字叫陈星宇, My name is Emiaostein"

public let str10 = "我的名字叫陈🐱🐱🐱星宇, My name is Emiaostein"

public let str11 = "我的名字叫陈星宇, My name is Emiaostein🐱🐱🐱"

public let str12 = "\n🐱我的名字叫陈星宇, My name is Emiaostein"

public let str13 = "我的名字叫陈\n🐱星宇, My name is Emiaostein"

public let str14 = "我的名字叫陈星宇, My name is Emiaostein\n🐱"

public let str15 = "🐱\n🐱我的名字叫陈星宇, My name is Emiaostein"

public let str16 = "我的名字叫陈🐱\n🐱星宇, My name is Emiaostein"

public let str17 = "我的名字叫陈星宇, My name is Emiaostein🐱\n🐱"

public let str18 = "🐱🐱🐱我的名字\n叫陈星宇, My name is\n Emiaostein"

public let str19 = "My name is Emiaostein"

public let str20 = "ou🐱ou🐱🐱What"

public let fontS = UIFont.systemFontOfSize(15)
public let fontSL = UIFont.systemFontOfSize(30)
public let fontD = UIFont(name: "Zapfino", size: 15)! //AvenirNext-Italic Zapfino,AmericanTypewriter
public let fontDL = UIFont(name: "Zapfino", size: 30)! //

public func demoString() -> NSAttributedString
{
  // Create the attributed string
  let demoString = NSMutableAttributedString(string:"Welcome to ou🐱🐱🐱n")
  
  // Declare the fonts
  let demoStringFont1 = UIFont(name:"Zapfino", size:24.0)
  let demoStringFont2 = UIFont(name:"AvenirNext-Regular", size:24.0)
  let demoStringFont3 = UIFont(name:"Helvetica-Bold", size:24.0)
  let demoStringFont4 = UIFont(name:"AppleColorEmoji", size:24.0)
  
  // Declare the colors
  let demoStringColor1 = UIColor(red: 0.292745, green: 0.461693, blue: 0.998524, alpha: 1.000000)
  let demoStringColor2 = UIColor(red: 1.000000, green: 0.000000, blue: 0.000000, alpha: 1.000000)
  
  // Declare the paragraph styles
  let demoStringParaStyle1 = NSMutableParagraphStyle()
  demoStringParaStyle1.alignment = NSTextAlignment.Center
  demoStringParaStyle1.tabStops = [
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 28.000000, options: [String: AnyObject]()),
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
    NSTextTab(textAlignment: NSTextAlignment.Left, location: 336.000000, options: [String: AnyObject]())
  ]
  
  
  // Create the attributes and add them to the string
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(0,3))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont1!, range:NSMakeRange(0,3))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(0,3))
  demoString.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(0,3))
  demoString.addAttribute(NSBackgroundColorAttributeName, value:demoStringColor2, range:NSMakeRange(0,3))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(3,3))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont2!, range:NSMakeRange(3,3))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(3,3))
  demoString.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(3,3))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(6,2))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(6,2))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont2!, range:NSMakeRange(6,2))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(8,1))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(8,1))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont3!, range:NSMakeRange(8,1))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(9,4))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(9,4))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont2!, range:NSMakeRange(9,4))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(13,4))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(13,4))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont4!, range:NSMakeRange(13,4))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(17,2))
  demoString.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(17,2))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont4!, range:NSMakeRange(17,2))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(17,2))
  demoString.addAttribute(NSParagraphStyleAttributeName, value:demoStringParaStyle1, range:NSMakeRange(19,1))
  demoString.addAttribute(NSFontAttributeName, value:demoStringFont2!, range:NSMakeRange(19,1))
  demoString.addAttribute(NSUnderlineColorAttributeName, value:demoStringColor1, range:NSMakeRange(19,1))
  demoString.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(19,1))
  
  return NSAttributedString(attributedString:demoString)
}
