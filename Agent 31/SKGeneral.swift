//
//  SKGeneral.swift
//  Agent 31
//
//  Created by Julio Xavier on 01/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

let defaultAnchorPoint: CGPoint = CGPointMake(0, 1)
let middleOfTheScreenPoint: CGPoint = CGPointMake(667/2, 375/2)

func createSpriteNode(imageName: String, anchorPoint: CGPoint = defaultAnchorPoint, position: CGPoint = middleOfTheScreenPoint, name: String, scale: CGFloat = 0.5) -> SKSpriteNode{
    var sprite: SKSpriteNode
    let spriteTexture = SKTexture(imageNamed: imageName)
    
    sprite = SKSpriteNode(texture: spriteTexture)
    sprite.anchorPoint = anchorPoint
    sprite.position = position
    sprite.name = name
    sprite.setScale(scale)
    
    return sprite
}