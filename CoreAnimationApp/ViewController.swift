//
//  ViewController.swift
//  CoreAnimationApp
//
//  Created by Emiaostein on 11/2/15.
//  Copyright © 2015 Emiaostein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var animationView: AnimationView!
  var layers = [String: CALayer]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    
  }
  @IBAction func tapAction(sender: UITapGestureRecognizer) {
    
    animationView.removeAllAnimations()
    animationView.addFadeAnimation()
  }
  @IBAction func switchAction(sender: UISwitch) {
    
    animationView.layer.drawsAsynchronously = sender.on
  }
  
  override func viewDidAppear(animated: Bool) {
//    setupLayers()
//    animationView.transform = CGAffineTransformMakeRotation(45.0 * CGFloat(M_PI) / 180.0)
    animationView.layer.drawsAsynchronously = true
    animationView.addFadeAnimation()
    
    
    let font = UIFont(name: "Zapfino", size: 24)!
    
    let shadow = NSShadow()
    shadow.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
    shadow.shadowOffset = CGSizeMake(20.1, 20.1)
    shadow.shadowBlurRadius = 1
    
    let attributes = [
      NSFontAttributeName: font,
      NSForegroundColorAttributeName: UIColor.blueColor().colorWithAlphaComponent(1)
      //      NSShadowAttributeName: shadow,
      //      NSKernAttributeName: 10,
      //      NSLigatureAttributeName: 1
    ]
    
    let textStr = TextMetaData(str: "fou", rect: view.bounds, insets: UIEdgeInsetsZero, attributes: attributes, font: ["fontName": "Zapfino", "fontSize": 24.0])
    
    let texts = textStr.spliteTextBy(.Characters)
    
    let layer = CALayer()
    layer.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
    layer.backgroundColor = UIColor.redColor().CGColor
    for (i, text) in texts.enumerate() {
//      if i == 0 {
//        continue
//      }
      
      print(text.rect)
      let textLayer = CATextLayer()
      textLayer.frame = CGRectMake(text.rect.origin.x, text.rect.origin.y, CGRectGetWidth(text.rect) + 40, CGRectGetHeight(text.rect) + 40)
      textLayer.backgroundColor = UIColor.clearColor().CGColor
      textLayer.alignmentMode = kCAAlignmentCenter
      textLayer.string = text.str
      textLayer.font = "Zapfino"
      textLayer.fontSize = 24
      layer.addSublayer(textLayer)
      
      
    }
    
    view.layer.addSublayer(layer)
  }
  
  
  func setupLayers() {
    let demoString = "🐱"
    let demoStringFont2 = UIFont(name:"Zapfino", size:10)!
    let width = CGRectGetWidth(view.bounds)
    let height = CGRectGetHeight(view.bounds)
    let column = 10
    let row = 20
    let widthRate = width / CGFloat(column)
    let heightRate = height / CGFloat(row)
    
    for i in 0..<column {
      for j in 0..<row {
        let frame = CGRectMake(CGFloat(i) * widthRate, CGFloat(j) * heightRate, widthRate, heightRate)
        let textLayer = CATextLayer()
        textLayer.frame = frame
        textLayer.foregroundColor = UIColor.redColor().CGColor
        textLayer.string = demoString
        textLayer.font = demoStringFont2
        textLayer.fontSize = 10
        view.layer.addSublayer(textLayer)
        layers["layer(i,j)"] = textLayer
      }
    }
  }
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

