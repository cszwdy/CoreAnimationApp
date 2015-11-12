//
//  AnimationView.swift
//
//  Code generated using QuartzCode 1.38.3 on 11/2/15.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class AnimationView: UIView {
  
  let column = 20
  let row = 30
  
  var lines: [(CGRect, NSAttributedString, CGPoint)]?
	
	var updateLayerValueForCompletedAnimation : Bool = true
	var animationAdded : Bool = false
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var layers : Dictionary<String, AnyObject> = [:]

	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	var fadeAnimProgress: CGFloat = 0{
		didSet{
			if(!self.animationAdded){
				removeAllAnimations()
				addFadeAnimation()
				self.animationAdded = true
				layer.speed = 0
				layer.timeOffset = 0
			}
			else{
				let totalDuration : CGFloat = 1.56
				let offset = fadeAnimProgress * totalDuration
				layer.timeOffset = CFTimeInterval(offset)
			}
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
    
    guard let lines = lines else {
      return
    }
    
    let effect = CALayer()
    effect.frame = bounds
//    effect.geometryFlipped = true
    self.layer.addSublayer(effect)
    layers["effect"] = effect
    
    for (i, lineInfo) in lines.enumerate() {
      let rect = lineInfo.0
      let attr = lineInfo.1
      let origin = lineInfo.2
      
      let shapeLayer = CALayer()
      //  shapeLayer.backgroundColor = UIColor.blackColor().CGColor
//      shapeLayer.geometryFlipped = true
//      shapeLayer.frame = rect
      let pathInfos = pathForLettersAttribueString(attr)
      
      for (j, pathInfo) in pathInfos.enumerate() {
        if pathInfo.emoji {
          let emojiLayer = CATextLayer()
          layers["emojiLayer(\(i),\(j))"] = emojiLayer
//          emojiLayer.geometryFlipped = true
          emojiLayer.frame = pathInfo.emojiRect!
//          emojiLayer.frame.size.height += 6
//          emojiLayer.frame.origin.y -= 6
          
//          emojiLayer.backgroundColor = UIColor.redColor().CGColor
          emojiLayer.frame.origin.y += -pathInfo.emojiRect!.height + origin.y + rect.origin.y
          emojiLayer.frame.origin.x += rect.origin.x
          emojiLayer.string = pathInfo.attributeString
          effect.addSublayer(emojiLayer)
//         let nextFrame = shapeLayer.convertRect(emojiLayer.frame, toLayer: effect)
//          emojiLayer.frame = nextFrame
//          effect.addSublayer(emojiLayer)
          
        } else {
          
          let textShapeLayer = CAShapeLayer()
          layers["textShapeLayer(\(i),\(j))"] = textShapeLayer
          textShapeLayer.fillColor = UIColor.blueColor().CGColor
//          textShapeLayer.geometryFlipped = true
          textShapeLayer.frame = pathInfo.emojiRect!
          
          textShapeLayer.frame.origin.y += -pathInfo.emojiRect!.height + origin.y + rect.origin.y
          textShapeLayer.frame.origin.x += rect.origin.x
          textShapeLayer.path = pathInfo.path
          effect.addSublayer(textShapeLayer)
//          let nextFrame = shapeLayer.convertRect(textShapeLayer.frame, toLayer: effect)
        }
      }
//      effect.addSublayer(shapeLayer)
    }
    
    
//		let effect = CALayer()
//		effect.frame = bounds
//
//		self.layer.addSublayer(effect)
//		layers["effect"] = effect
//    
//    let width: CGFloat = 320
//    let height: CGFloat = 568
//    let widthRate = width / CGFloat(column)
//    let heightRate = height / CGFloat(row)
    
//    for i in 0..<column {
//      for j in 0..<row {
//        let frame = CGRectMake(CGFloat(i) * widthRate, CGFloat(j) * heightRate, widthRate, heightRate)
//        
//        let imageLayer = CALayer()
//        imageLayer.frame = frame
//        effect.addSublayer(imageLayer)
//        layers["imagelayer(\(i),\(j))"] = imageLayer
//        
//        
//        let textLayer = CATextLayer()
//        textLayer.frame = frame
//        effect.addSublayer(textLayer)
//        layers["layer(\(i),\(j))"] = textLayer
//        
//        
//      }
//    }
		resetLayerPropertiesForLayerIdentifiers(nil)
	}
	
	func resetLayerPropertiesForLayerIdentifiers(layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
    
//    for (layerIds, subLayer) in layers {
//      
//      if layer
//      
//    }
    
//    for i in 0..<column {
//      for j in 0..<row {
//        let ids = "layer(\(i),\(j))"
//        let imageIds = "imagelayer(\(i),\(j))"
//        if layerIds == nil || layerIds.contains(ids){
//          let text = layers[ids] as! CATextLayer
//          text.anchorPoint     = CGPointMake(1, 1)
//          text.contentsScale   = UIScreen.mainScreen().scale
//          text.string          = "🐱"
//          text.font            = "Helvetica"
//          text.fontSize        = 12
//          text.alignmentMode   = kCAAlignmentCenter;
//          text.foregroundColor = UIColor.blackColor().CGColor;
//        }
//        
//        if layerIds == nil || layerIds.contains(imageIds){
//          let image = layers[imageIds] as! CALayer
//          image.contentsScale = 20.0
//          image.contents = UIImage(named:"Oval")?.CGImage
//        }
//        
//      }
//    }
		CATransaction.commit()
	}
  //MARK: - Animation Setup
  
  func addFadeAnimation(){
    addFadeAnimationCompletionBlock(nil)
  }
  
  func addFadeAnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
    addFadeAnimationReverse(false, totalDuration:1.7, endTime:1, completionBlock:completionBlock)
  }
  
  func addFadeAnimationReverse(reverseAnimation: Bool, totalDuration: CFTimeInterval, endTime: CFTimeInterval, completionBlock: ((finished: Bool) -> Void)?){
    let endTime = endTime * totalDuration
    
    if completionBlock != nil{
      let completionAnim = CABasicAnimation(keyPath:"completionAnim")
      completionAnim.duration = endTime
      completionAnim.delegate = self
      completionAnim.setValue("fade", forKey:"animId")
      completionAnim.setValue(true, forKey:"needEndAnim")
      layer.addAnimation(completionAnim, forKey:"fade")
      if let anim = layer.animationForKey("fade"){
        completionBlocks[anim] = completionBlock
      }
    }
    
    if (!reverseAnimation) {resetLayerPropertiesForLayerIdentifiers(["effect"])}
    let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
    
    ////Effect animation
    let effectOpacityAnim            = CABasicAnimation(keyPath:"opacity")
    effectOpacityAnim.fromValue      = 1;
    effectOpacityAnim.toValue        = 0;
    effectOpacityAnim.duration       = 0.5 * totalDuration
    effectOpacityAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
    effectOpacityAnim.setValue(0.1 * totalDuration, forKeyPath:"instanceDelay")
    effectOpacityAnim.setValue(0, forKeyPath:"instanceOrder")
    
    let effectTransformAnim            = CABasicAnimation(keyPath:"transform")
    effectTransformAnim.fromValue      = NSValue(CATransform3D: CATransform3DIdentity);
    effectTransformAnim.toValue        = NSValue(CATransform3D: CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(1.5, 1.5, 1), CATransform3DMakeTranslation(-150, 150, 0)), CATransform3DMakeRotation(-15 * CGFloat(M_PI/180), -0, 0, 1)));
    effectTransformAnim.duration       = 0.5 * totalDuration
    effectTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
    effectTransformAnim.setValue(0.1 * totalDuration, forKeyPath:"instanceDelay")
    effectTransformAnim.setValue(0, forKeyPath:"instanceOrder")
    
    let effectFadeAnim : CAAnimationGroup = QCMethod.groupAnimations([effectOpacityAnim, effectTransformAnim], fillMode:fillMode, forEffectLayer:true, sublayersCount:layers.count - 1)
    QCMethod.addSublayersAnimationNeedReverse(effectFadeAnim, key:"effectFadeAnim", layer:layers["effect"] as! CALayer, reverseAnimation:reverseAnimation, totalDuration:totalDuration)
  }
  
  //MARK: - Animation Cleanup
  
  override func animationDidStop(anim: CAAnimation, finished flag: Bool){
    if let completionBlock = completionBlocks[anim]{
      completionBlocks.removeValueForKey(anim)
      if (flag && updateLayerValueForCompletedAnimation) || anim.valueForKey("needEndAnim") as! Bool{
        updateLayerValuesForAnimationId(anim.valueForKey("animId") as! String)
        removeAnimationsForAnimationId(anim.valueForKey("animId") as! String)
      }
      completionBlock(flag)
    }
  }
  
  func updateLayerValuesForAnimationId(identifier: String){
    if identifier == "fade"{
      QCMethod.updateValueFromPresentationLayerForAnimation((layers["effect"] as! CALayer).animationForKey("effectFadeAnim"), theLayer:(layers["effect"] as! CALayer))
    }
  }
  
  func removeAnimationsForAnimationId(identifier: String){
    if identifier == "fade"{
      (layers["effect"] as! CALayer).removeAnimationForKey("effectFadeAnim")
    }
    self.layer.speed = 1
  }
  
  func removeAllAnimations(){
    for layer in layers.values{
      (layer as! CALayer).removeAllAnimations()
    }
    self.layer.speed = 1
  }
	
}
