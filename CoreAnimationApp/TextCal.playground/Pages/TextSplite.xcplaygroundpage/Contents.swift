//: [Previous](@previous)

import Foundation
import UIKit

var str = "🐱🐱What ca🐱n \n How old" as NSString

/*  -- EMIAOSTEIN; 2015-11-10-12:24

NSStringEnumerationOptions
ByLines:
ByParagraphs:
ByComposedCharacterSequences
ByWords
BySentences
Reverse
SubstringNotRequired
Localized

*/

str.enumerateSubstringsInRange(NSMakeRange(0, str.length), options: [.ByComposedCharacterSequences,.Reverse]) { (string, substringRange, enclosingRange, stop) -> Void in
  
  print("string = \(string), subRange = \(substringRange), enclosingRange = \(enclosingRange)")
}
