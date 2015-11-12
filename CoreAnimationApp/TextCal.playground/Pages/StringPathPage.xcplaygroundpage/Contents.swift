//: [Previous](@previous)

import Foundation
import UIKit

let attr = demoString()

/*  -- Emiaostein; 2015-11-10-22:32

ByLines: NSStringEnumeration
ByParagraphs: NSStringEnumer
ByComposedCharacterSequences
ByWords: NSStringEnumeration
BySentences: NSStringEnumera
Reverse: NSStringEnumeration
SubstringNotRequired: NSStri
Localized: NSStringEnumerati

*/
//let option1: NSStringEnumerationOptions = [.ByLines]
let option2: NSStringEnumerationOptions = [.ByParagraphs]
let option3: NSStringEnumerationOptions = [.ByComposedCharacterSequences]
let option4: NSStringEnumerationOptions = [.ByWords]
//let option5: NSStringEnumerationOptions = [.BySentences]
let option6: NSStringEnumerationOptions = [.ByWords, .Localized]
//let option7: NSStringEnumerationOptions = [.BySentences, .Localized]


let str = (attr.string as NSString)
str.enumerateSubstringsInRange(NSMakeRange(0, attr.length), options: option6) { (string, stringRange, enclosedRange, stop) -> Void in
  
//  print("String = \(str.substringWithRange(enclosedRange)), stringRange = \(stringRange), enclosedRange = \(enclosedRange)")
  
  attr.enumerateAttributesInRange(enclosedRange, options: .LongestEffectiveRangeNotRequired) { (attribute, range, stop) -> Void in
    let str = (attr.string as NSString).substringWithRange(range)
//    print("str = \(str), range = \(range)")
  }
}

attr.enumerateAttributesInRange(NSMakeRange(0, attr.length), options: .LongestEffectiveRangeNotRequired) { (attribute, range, stop) -> Void in
  let str = (attr.string as NSString).substringWithRange(range)
  print("str = \(str), range = \(range)")
}

