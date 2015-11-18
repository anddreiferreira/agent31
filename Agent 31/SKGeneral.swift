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

// Defines
let TURNED_LEFT: Int = 1
let TURNED_UP: Int = 3
let TURNED_RIGHT: Int = 2
let MAX_CHARACTER_VELOCITY: CGFloat = 40.0
let MIN_CHARACTER_VELOCITY: CGFloat = -40.0
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

func createLabelNode(text: String, fontName: String = defaultFontName, position: CGPoint = middleOfTheScreenPoint, fontSize: CGFloat = 32.0, color: SKColor = SKColor.whiteColor(), zPosition: CGFloat = 1.0, alignmentMode: SKLabelHorizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center,name: String) -> SKLabelNode {
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

func buttonTapped(nodeTapped: SKNode){
    
    let scale1 = SKAction.scaleTo(0.52, duration: 0.01)
    let scale2 = SKAction.scaleTo(0.54, duration: 0.01)
    let scale3 = SKAction.scaleTo(0.56, duration: 0.01)
    let scale4 = SKAction.scaleTo(0.50, duration: 0.01)
    
    let sequence = SKAction.sequence([scale1,scale2,scale3,scale2, scale1, scale4])
    
    nodeTapped.runAction(sequence)
    
}

func nodeLighting(nodeTapped: SKNode){

    let action1 : SKAction = SKAction.fadeAlphaTo(0.1, duration: 0.5)
    let action2 : SKAction = SKAction.fadeAlphaTo(1, duration: 0.5)
    let action3 : SKAction = SKAction.sequence([action1, action2])

    nodeTapped.runAction(SKAction.repeatActionForever(action3))
}


func generateTextureWithImage(image: String) -> SKTexture{
    
    let imageTexture = SKTexture(imageNamed: image)
    imageTexture.filteringMode = SKTextureFilteringMode.Nearest
    
    return imageTexture
}

func loadAnimationTexturesArray(mainText: String, numberOfImages: Int) -> Array<SKTexture>{
    
    // All sequence of animations should start like 'mainText1'
    let initialIndex: Int = 1
    var texturesArray: Array<SKTexture> = []
    
    for(var i = initialIndex; i<=numberOfImages; i++){
        
        let imageName = String(format: "%@%i", arguments: [mainText, i])
        debugPrint("loadAnimation: Using texture named \(imageName)")
        let texture: SKTexture = generateTextureWithImage(imageName)
        
        texturesArray.append(texture)
    }
    
    return texturesArray
}

func animateWithTextures(animations: Array<SKTexture>,timePerTexture: NSTimeInterval,repeatCount: Int = 1) ->SKAction{
    
    let action: SKAction = SKAction.animateWithTextures(animations, timePerFrame: timePerTexture)
    let repeatedAction: SKAction = SKAction.repeatAction(action, count: repeatCount)
    
    return repeatedAction
    
}

func repeatAnimationFoveverWithTextures(animations: Array<SKTexture>, timePerTexture: NSTimeInterval)->SKAction{
    
    let initialAction: SKAction = SKAction.animateWithTextures(animations, timePerFrame: timePerTexture)
    let repeatForever: SKAction = SKAction.repeatActionForever(initialAction)
    
    return repeatForever
    
}

func actionWithAnimationName(mainText: String, numberOfImages: Int, timePerTexture: NSTimeInterval, repeatCount: Int = 1)->SKAction{
    
    let texturesArray: Array<SKTexture> = loadAnimationTexturesArray(mainText, numberOfImages: numberOfImages)
    
    let finalAction: SKAction = animateWithTextures(texturesArray, timePerTexture: timePerTexture, repeatCount: repeatCount)
    
    return finalAction
}

func repeatActionForeverWithAnimationName(mainText: String, numberOfImages: Int, timePerTexture: NSTimeInterval)->SKAction{
    let texturesArray: Array<SKTexture> = loadAnimationTexturesArray(mainText, numberOfImages: numberOfImages)
    
    let repeatForever: SKAction = repeatAnimationFoveverWithTextures(texturesArray, timePerTexture: timePerTexture)
    
    return repeatForever
}


// MARK: Notification
func scheduleNotification(launchInterval: NSTimeInterval, itemName: String, itemLevel: Int, badge: Int){
    let notification:UILocalNotification = UILocalNotification()
    notification.fireDate = NSDate().dateByAddingTimeInterval(launchInterval)
    notification.timeZone = NSTimeZone.defaultTimeZone()
    notification.alertBody = "\(itemName) upgrade to \(itemLevel) finished"
    notification.applicationIconBadgeNumber = badge
    notification.soundName = UILocalNotificationDefaultSoundName
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
}

func distanceBetweenPoints( first: CGPoint, second: CGPoint ) -> CGFloat {
    return CGFloat(hypotf(Float(second.x - first.x), Float(second.y - first.y)))
}