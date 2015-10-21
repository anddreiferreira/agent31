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
let defaultFontName: String = "copperplate"

func createSpriteNode(imageName: String, position: CGPoint = middleOfTheScreenPoint, anchorPoint: CGPoint = defaultAnchorPoint, scale: CGFloat = 0.5, zPosition: CGFloat = 1.0, name: String) -> SKSpriteNode{
    var sprite: SKSpriteNode
    let spriteTexture = generateTextureWithImage(imageName)
    
    sprite = SKSpriteNode(texture: spriteTexture)
    sprite.anchorPoint = anchorPoint
    sprite.position = position
    sprite.name = name
    sprite.setScale(scale)
    sprite.zPosition = zPosition
    
    return sprite
}

func createLabelNode(text: String, fontName: String = defaultFontName, position: CGPoint = middleOfTheScreenPoint, fontSize: CGFloat = 32.0, color: SKColor = SKColor.whiteColor(), zPosition: CGFloat = 1.0, alignmentMode: SKLabelHorizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center,name: String) -> SKLabelNode{
    var label: SKLabelNode
    
    label = SKLabelNode(text: text)
    label.fontName = fontName
    label.position = position
    label.fontSize = fontSize
    label.color = color
    label.zPosition = zPosition
    label.horizontalAlignmentMode = alignmentMode;
    label.name = name
    
    return label
}

//func createLayerNode(position: CGPoint = CGPointZero, zPosition: CGFloat = 1.0, name: String = "") -> SKNode{
//    
//    var node: SKNode
//    
//    node = SKNode()
//    node.position = position
//    node.name = name
//    node.zPosition = zPosition
//    
//    return node
//}

func generateTextureWithImage(image: String) -> SKTexture{
    
    let imageTexture: SKTexture = SKTexture(imageNamed: imageNamed)
    imageTexture.filteringMode = SKTextureFilteringMode.Nearest
    
    return imageTexture
}

func loadAnimation(mainText: String, numberOfImages: Int) -> Array<SKTexture>{
    
    // All sequence of animations should start like 'mainText1'
    let initialIndex: Int = 1
    var texturesArray: Array<SKTexture> = []
    
    for(var i = initialIndex; i<=numberOfImages; i++){
        
        let imageName = String(format: "%@%i", arguments: [mainText, i])
        let texture: SKTexture = generateTextureWithImage(imageName)
        
        texturesArray.append(texture)
    }
    
    return texturesArray
}