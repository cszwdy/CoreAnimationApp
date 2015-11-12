//
//  CustomView.swift
//
//  Code generated using QuartzCode 1.38.3 on 11/9/15.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class CustomView: UIView {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = false
	
	
	
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
	
	
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let effect2 = CALayer()
		effect2.frame = CGRectMake(187.79, 222.73, 190.52, 116.08)
		self.layer.addSublayer(effect2)
		layers["effect2"] = effect2
		let rectangle5 = CAShapeLayer()
		rectangle5.frame = CGRectMake(25.64, 11.37, 43.37, 39.16)
		rectangle5.path = rectangle5Path().CGPath;
		effect2.addSublayer(rectangle5)
		layers["rectangle5"] = rectangle5
		let rectangle6 = CAShapeLayer()
		rectangle6.frame = CGRectMake(111.49, 11.37, 43.37, 39.16)
		rectangle6.path = rectangle6Path().CGPath;
		effect2.addSublayer(rectangle6)
		layers["rectangle6"] = rectangle6
		let rectangle7 = CAShapeLayer()
		rectangle7.frame = CGRectMake(111.49, 76.91, 43.37, 39.16)
		rectangle7.path = rectangle7Path().CGPath;
		effect2.addSublayer(rectangle7)
		layers["rectangle7"] = rectangle7
		let rectangle8 = CAShapeLayer()
		rectangle8.frame = CGRectMake(111.49, 11.37, 43.37, 39.16)
		rectangle8.path = rectangle8Path().CGPath;
		effect2.addSublayer(rectangle8)
		layers["rectangle8"] = rectangle8
		let rectangle9 = CAShapeLayer()
		rectangle9.frame = CGRectMake(25.64, 76.91, 43.37, 39.16)
		rectangle9.path = rectangle9Path().CGPath;
		effect2.addSublayer(rectangle9)
		layers["rectangle9"] = rectangle9
		
		let rectangle10 = CAShapeLayer()
		rectangle10.frame = CGRectMake(38.75, 0.61, 178.56, 148.27)
		rectangle10.path = rectangle10Path().CGPath;
		self.layer.addSublayer(rectangle10)
		layers["rectangle10"] = rectangle10
		let effect = CALayer()
		effect.frame = CGRectMake(33.01, 25.65, 112.54, 96.96)
		rectangle10.addSublayer(effect)
		layers["effect"] = effect
		let rectangle = CAShapeLayer()
		rectangle.frame = CGRectMake(0, 0, 35.48, 35.51)
		rectangle.path = rectanglePath().CGPath;
		effect.addSublayer(rectangle)
		layers["rectangle"] = rectangle
		let rectangle2 = CAShapeLayer()
		rectangle2.frame = CGRectMake(77.06, 0, 35.48, 35.51)
		rectangle2.path = rectangle2Path().CGPath;
		effect.addSublayer(rectangle2)
		layers["rectangle2"] = rectangle2
		let rectangle3 = CAShapeLayer()
		rectangle3.frame = CGRectMake(0, 61.45, 35.48, 35.51)
		rectangle3.path = rectangle3Path().CGPath;
		effect.addSublayer(rectangle3)
		layers["rectangle3"] = rectangle3
		let rectangle4 = CAShapeLayer()
		rectangle4.frame = CGRectMake(77.06, 61.45, 35.48, 35.51)
		rectangle4.path = rectangle4Path().CGPath;
		effect.addSublayer(rectangle4)
		layers["rectangle4"] = rectangle4
		
		let rectangle11 = CAShapeLayer()
		rectangle11.frame = CGRectMake(231.77, 173.86, 84.95, 68.19)
		rectangle11.path = rectangle11Path().CGPath;
		self.layer.addSublayer(rectangle11)
		layers["rectangle11"] = rectangle11
		
		let effect3 = CALayer()
		effect3.frame = CGRectMake(12.09, 320.25, 93.3, 67.54)
		self.layer.addSublayer(effect3)
		layers["effect3"] = effect3
		
		let text = CATextLayer()
		text.frame = CGRectMake(253.67, 12.23, 294.93, 101.07)
		self.layer.addSublayer(text)
		layers["text"] = text
		
		resetLayerPropertiesForLayerIdentifiers(nil)
	}
	
	func resetLayerPropertiesForLayerIdentifiers(layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("rectangle5"){
			let rectangle5 = layers["rectangle5"] as! CAShapeLayer
			rectangle5.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle5.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle6"){
			let rectangle6 = layers["rectangle6"] as! CAShapeLayer
			rectangle6.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle6.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle7"){
			let rectangle7 = layers["rectangle7"] as! CAShapeLayer
			rectangle7.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle7.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle8"){
			let rectangle8 = layers["rectangle8"] as! CAShapeLayer
			rectangle8.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle8.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle9"){
			let rectangle9 = layers["rectangle9"] as! CAShapeLayer
			rectangle9.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle9.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle10"){
			let rectangle10 = layers["rectangle10"] as! CAShapeLayer
			rectangle10.setValue(-42.05 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
			rectangle10.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle10.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle"){
			let rectangle = layers["rectangle"] as! CAShapeLayer
			rectangle.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle2"){
			let rectangle2 = layers["rectangle2"] as! CAShapeLayer
			rectangle2.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle2.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle3"){
			let rectangle3 = layers["rectangle3"] as! CAShapeLayer
			rectangle3.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle3.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle4"){
			let rectangle4 = layers["rectangle4"] as! CAShapeLayer
			rectangle4.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle4.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("rectangle11"){
			let rectangle11 = layers["rectangle11"] as! CAShapeLayer
			rectangle11.fillColor   = UIColor(red:0.922, green: 0.922, blue:0.922, alpha:1).CGColor
			rectangle11.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).CGColor
		}
		if layerIds == nil || layerIds.contains("text"){
			let text = layers["text"] as! CATextLayer
			text.alignmentMode = kCAAlignmentCenter;
			text.contentsScale = UIScreen.mainScreen().scale
			var textAttributes = [NSFontAttributeName: UIFont(name:"Helvetica", size:50)!, 
				NSForegroundColorAttributeName: UIColor.blackColor()]
			var textText       = "Hello World!"
			var textAttributedText = NSAttributedString(string: textText, attributes: textAttributes)
			text.string = textAttributedText
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addUntitled1Animation(){
		addUntitled1AnimationCompletionBlock(nil)
	}
	
	func addUntitled1AnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 1.933
			completionAnim.delegate = self
			completionAnim.setValue("Untitled1", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.addAnimation(completionAnim, forKey:"Untitled1")
			if let anim = layer.animationForKey("Untitled1"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : String = kCAFillModeForwards
		
		////Effect2 animation
		let effect2TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		effect2TransformAnim.values   = [NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity)]
		effect2TransformAnim.keyTimes = [0, 0.373, 1]
		effect2TransformAnim.duration = 0.743
		effect2TransformAnim.setValue(0.297, forKeyPath:"instanceDelay")
		effect2TransformAnim.setValue(0, forKeyPath:"instanceOrder")
		
		let effect2TransformAnim       = CABasicAnimation(keyPath:"transform.rotation")
		effect2TransformAnim.fromValue = -45 * CGFloat(M_PI/180);
		effect2TransformAnim.toValue   = 0;
		effect2TransformAnim.duration  = 1.49
		
		let effect2PositionAnim       = CABasicAnimation(keyPath:"position")
		effect2PositionAnim.fromValue = NSValue(CGPoint: CGPointMake(283.056, 280.769));
		effect2PositionAnim.toValue   = NSValue(CGPoint: CGPointMake(283.056, 400));
		effect2PositionAnim.duration  = 1.49
		
		let effect2Untitled1Anim : CAAnimationGroup = QCMethod.groupAnimations([effect2TransformAnim, effect2TransformAnim, effect2PositionAnim], fillMode:kCAFillModeBoth, forEffectLayer:true, sublayersCount:5)
		QCMethod.addSublayersAnimation(effect2Untitled1Anim, key:"effect2Untitled1Anim", layer:layers["effect2"] as! CALayer)
		
		////Effect animation
		let effectTransformAnim       = CABasicAnimation(keyPath:"transform.translation")
		effectTransformAnim.fromValue = NSValue(CGSize:CGSizeMake(-100, 0));
		effectTransformAnim.toValue   = NSValue(CGSize:CGSizeMake(0, 0));
		effectTransformAnim.duration  = 0.743
		effectTransformAnim.setValue(0.297, forKeyPath:"instanceDelay")
		effectTransformAnim.setValue(0, forKeyPath:"instanceOrder")
		
		let effectUntitled1Anim : CAAnimationGroup = QCMethod.groupAnimations([effectTransformAnim], fillMode:kCAFillModeBoth, forEffectLayer:true, sublayersCount:4)
		QCMethod.addSublayersAnimation(effectUntitled1Anim, key:"effectUntitled1Anim", layer:layers["effect"] as! CALayer)
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
		if identifier == "Untitled1"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["effect2"] as! CALayer).animationForKey("effect2Untitled1Anim"), theLayer:(layers["effect2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["effect"] as! CALayer).animationForKey("effectUntitled1Anim"), theLayer:(layers["effect"] as! CALayer))
		}
	}
	
	func removeAnimationsForAnimationId(identifier: String){
		if identifier == "Untitled1"{
			(layers["effect2"] as! CALayer).removeAnimationForKey("effect2Untitled1Anim")
			(layers["effect"] as! CALayer).removeAnimationForKey("effectUntitled1Anim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func rectangle5Path() -> UIBezierPath{
		let rectangle5Path = UIBezierPath(rect:CGRectMake(0, 0, 43, 39))
		return rectangle5Path;
	}
	
	func rectangle6Path() -> UIBezierPath{
		let rectangle6Path = UIBezierPath(rect:CGRectMake(0, 0, 43, 39))
		return rectangle6Path;
	}
	
	func rectangle7Path() -> UIBezierPath{
		let rectangle7Path = UIBezierPath(rect:CGRectMake(0, 0, 43, 39))
		return rectangle7Path;
	}
	
	func rectangle8Path() -> UIBezierPath{
		let rectangle8Path = UIBezierPath(rect:CGRectMake(0, 0, 43, 39))
		return rectangle8Path;
	}
	
	func rectangle9Path() -> UIBezierPath{
		let rectangle9Path = UIBezierPath(rect:CGRectMake(0, 0, 43, 39))
		return rectangle9Path;
	}
	
	func rectangle10Path() -> UIBezierPath{
		let rectangle10Path = UIBezierPath(rect:CGRectMake(0, 0, 179, 148))
		return rectangle10Path;
	}
	
	func rectanglePath() -> UIBezierPath{
		let rectanglePath = UIBezierPath(rect:CGRectMake(0, 0, 35, 36))
		return rectanglePath;
	}
	
	func rectangle2Path() -> UIBezierPath{
		let rectangle2Path = UIBezierPath(rect:CGRectMake(0, 0, 35, 36))
		return rectangle2Path;
	}
	
	func rectangle3Path() -> UIBezierPath{
		let rectangle3Path = UIBezierPath(rect:CGRectMake(0, 0, 35, 36))
		return rectangle3Path;
	}
	
	func rectangle4Path() -> UIBezierPath{
		let rectangle4Path = UIBezierPath(rect:CGRectMake(0, 0, 35, 36))
		return rectangle4Path;
	}
	
	func rectangle11Path() -> UIBezierPath{
		let rectangle11Path = UIBezierPath(rect:CGRectMake(0, 0, 85, 68))
		return rectangle11Path;
	}
	
	
}
