//: [Previous](@previous)

import Foundation
import UIKit

var str = demoString()
let line = CTLineCreateWithAttributedString(str)
let runs = CTLineGetGlyphRuns(line)
let runCount = CFArrayGetCount(runs)

let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, 0), CTRun.self)
print(run)

let runAttributes = CTRunGetAttributes(run)
let runFont = unsafeBitCast(CFDictionaryGetValue(runAttributes, unsafeAddressOf(kCTFontAttributeName)), CTFontRef.self)

let glyphCount = CTRunGetGlyphCount(run)
let bounds = CTRunGetTypographicBounds(run, CFRangeMake(0, glyphCount), nil, nil, nil)
let imageBounds = CTRunGetImageBounds(run, nil, CFRangeMake(0, glyphCount))
UIGraphicsBeginImageContext(imageBounds.size)
let context = UIGraphicsGetCurrentContext()
//CGContextScaleCTM(context!, 1.0, -1.0)
//CGContextTranslateCTM(context!, 0, -40)

let sub = str.attributedSubstringFromRange(NSMakeRange(0, 3))
sub.drawAtPoint(CGPointZero)
//CTRunDraw(run, context!, CFRangeMake(0, glycount))
let image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

image

var glyphs = Array(count: glyphCount, repeatedValue: CGGlyph())
var positions = Array(count: glyphCount, repeatedValue: CGPoint())
CTRunGetGlyphs(run, CFRangeMake(0, glyphCount), &glyphs)

let glyph = glyphs[1]
let path = CTFontCreatePathForGlyph(runFont, glyph, nil)!
let bez = UIBezierPath(CGPath: path)

// MARK: - Words
// 1.

let textLayer = CATextLayer()
textLayer.backgroundColor = UIColor.blueColor().CGColor
textLayer.frame = CGRect(x: 50, y: 0, width: 40, height: 100)
textLayer.string = "f"
textLayer.font = "Zapfino"
textLayer.fontSize = 20
textLayer.contentsRect = CGRect(x: 0, y: 0, width: 1.5, height: 1)

let vi = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
vi.backgroundColor = UIColor.redColor()
vi.layer.addSublayer(textLayer)
vi

// MARK: - Characters
//let line = CTLineCreateWithAttributedString(str)
//let runs = CTLineGetGlyphRuns(line)
//let runCount = CFArrayGetCount(runs)
//
//let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, 4), CTRun.self)
//let a = CTRunGetStringRange(run)
//let runAttributes = CTRunGetAttributes(run)
//let runFont = unsafeBitCast(CFDictionaryGetValue(runAttributes, unsafeAddressOf(kCTFontAttributeName)), CTFontRef.self)
//print(attrFont)


// MARK: - Lines


//: [Next](@next)
