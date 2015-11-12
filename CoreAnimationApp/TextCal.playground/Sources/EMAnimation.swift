import Foundation
import UIKit

// textDelivery + textDeliveryOrder // leftToRight, RightToLeft, EdgeToCenter, CenterToEdge
// delivery + deliveryRange
// Order + delay
// Direction // 9 + 1
// duration

/**
Use to Config the Begain Direction of Appear Animation and End Direction of Disappear Animation;

- Top:    Canvas's Top Edge
- Middle: Canvas's Middle Of Top&Bottom Edge
- Bottom: Canvas's Bottom Edge
- Left:   Canvas's Left Edge
- Center: Canvas's Middle Of Left&Right Edge
- Right:  Canvas's Right Edge
- From:   The Begain Direction of Appear Animation
- To:     The End Direction of Disppear Animaton
*/
public enum EMAnimationDirectionType {
  
  public enum EMAnimationVerticalDirection {
    case Top, Middle, Bottom
  }
  
  public enum EMAnimationHorDirection {
    case Left, Center, Right
  }
  
  case From(EMAnimationVerticalDirection, EMAnimationHorDirection)
  case To(EMAnimationVerticalDirection, EMAnimationHorDirection)
  
}

/**
 The text elements's Animation playing order, the order depend on EMAnimationTextDeliveryType
 
 - Default:   All in once. text element's all line play animation at the same moment.
 - Paragraph: One by one. text element's lines play one by one.
 */
public enum EMAnimationDeliveryType {
  
  case Default, Paragraph(Int, Int)
}

/**
 The single Line's element play animation's order
 
 - Forward:           left to right.
 - Backward:          right to left.
 - Center:            from center to edge.
 - Edge:              from edge to center.
 - Random:            random
 - Default//ByObject: The line's elment play as a union
 - ByWords:           The text line seperate by word and play animation by words
 - ByCharacter:       The text line seperate by character and play animation by character
 */
public enum EMAnimationTextDeliveryType {
  
  public enum EMAnimationTextDeliveryOrder {
    case Forward, Backward, Center, Edge, Random
  }
  
  case Default(EMAnimationTextDeliveryOrder) // By Object
  case ByWords(EMAnimationTextDeliveryOrder)
  case ByCharacter(EMAnimationTextDeliveryOrder)
}

/**
 The Order among Eelments group
 
 - With//delay:  Play animation with the previous's begain
 - After//delay: Play animation at the end of previous animation
 */
public enum EMAnimationPlayOrderType {
  
  case With(CGFloat) // delay
  case After(CGFloat) // delay
  
}

public struct EMAnimationConfig {
  
  public let duration: CFTimeInterval
  public let playOrderType: EMAnimationPlayOrderType
  public let deliveryType: EMAnimationDeliveryType
  public let textDeliveryType: EMAnimationTextDeliveryType
  public let directionType: EMAnimationDirectionType
  
  public init(
    duration: CFTimeInterval,
    playOrderType: EMAnimationPlayOrderType = .After(0.0),
    deliveryType: EMAnimationDeliveryType = .Default,
    textDeliveryType: EMAnimationTextDeliveryType = .Default(.Forward),
    directionType: EMAnimationDirectionType = .From(.Middle, .Center)) {
      
      self.duration = duration
      self.playOrderType = playOrderType
      self.deliveryType = deliveryType
      self.textDeliveryType = textDeliveryType
      self.directionType = directionType
  }
}


public enum EMAnimation {
  case Advance1(EMAnimationConfig)
  case Advance2(EMAnimationConfig)
  case Advance3(EMAnimationConfig)
}

