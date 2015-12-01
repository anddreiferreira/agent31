//
//  UpgradeLayer.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/17/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class UpgradeLayer: SKNode
{
    
    var background: SKSpriteNode?
    var upgradeName: SKLabelNode?
    var upgradeLevel: SKLabelNode?
    var resourceAvailableIcon: SKSpriteNode?
    var resourceAvailableLabel: SKLabelNode?
    var cancelButton: SKSpriteNode?
    var animationArea: SKSpriteNode?
    var upgradeButton: SKLabelNode?
    var upgradeResourceCost: SKLabelNode?
    var upgradeDuration: SKLabelNode?
    
    var upgradeItem: String?
    
    init(attributeName: String, upgradeItem: String, resourceType: String) {
        
        super.init()
        
        self.upgradeItem = upgradeItem
        
        loadFirstPlan()
        loadSecondPlan()
        loadAttributeName(attributeName)
        loadAttributeLevel(attributeName)
        loadResourceType(resourceType)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func loadFirstPlan() {
        
        background = createSpriteNode("bgBlur", position: CGPointZero, anchorPoint: CGPointMake(0.5, 0.5), zPosition: zPosition3rd, name: "backgroundTraining")
        self.addChild(background!)
        
    }
    
    func loadSecondPlan() {
        
        cancelButton = createSpriteNode("exitButton", position: CGPoint(x: -middleOfTheScreenPoint.x + 570, y: -middleOfTheScreenPoint.y + 355), zPosition: zPosition4th, name: "btnCancelUpgrade")
        self.addChild(cancelButton!)
        
        animationArea = createSpriteNode("animationArea", position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 300), zPosition: zPosition4th, name: "animationArea")
        self.addChild(animationArea!)
        
        upgradeButton = createLabelNode("TRAIN NOW", position: CGPoint(x: -middleOfTheScreenPoint.x + 485, y: -middleOfTheScreenPoint.y + 200), fontSize: 40, zPosition: zPosition4th, name: "btnDoUpgrade" + upgradeItem!)
        self.addChild(upgradeButton!)
        
    }
    
    func loadAttributeName(attributeName: String) {
        
        upgradeName = createLabelNode(attributeName, position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 330), fontSize: 40, zPosition: zPosition4th, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "lblDoUpgrade")
        self.addChild(upgradeName!)
        
    }
    
    func loadAttributeLevel(attributeName: String) {
        
        var attributeLevel: Int
        
        switch attributeName {
        case "speed":
            attributeLevel = CharacterData.sharedInstance.speed
        case "jump":
            attributeLevel = CharacterData.sharedInstance.jump
        case "shootingPower":
            attributeLevel = CharacterData.sharedInstance.shootingPower
        case "shootingRange":
            attributeLevel = CharacterData.sharedInstance.shootingRange
        case "backPack":
            attributeLevel = CharacterData.sharedInstance.backPack
        case "gun1":
            attributeLevel = 0
        case "gun2":
            attributeLevel = 0
        default:
            attributeLevel = 0
            
        }
        
        upgradeLevel = createLabelNode("Level " + String(attributeLevel), position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 310), fontSize: 15, zPosition: zPosition4th, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgradeLevel")
        self.addChild(upgradeLevel!)
        
    }
    
    func loadResourceType(resourceType: String) {
        
        if resourceType == "ouro" {
            
            resourceAvailableIcon = createSpriteNode("coinCity", position: CGPoint(x: -middleOfTheScreenPoint.x + 410, y: -middleOfTheScreenPoint.y + 350), zPosition: zPosition4th, name: "goldIcon")
            self.addChild(resourceAvailableIcon!)
            
            resourceAvailableLabel = createLabelNode(String(ResourcesData.sharedInstance.gold), position: CGPoint(x: -middleOfTheScreenPoint.x + 480, y: -middleOfTheScreenPoint.y + 332), fontSize: 20, zPosition: zPosition4th, name: "goldAvailableLabel")
            self.addChild(resourceAvailableLabel!)
            
        } else if resourceType == "metal" {
            
            resourceAvailableIcon = createSpriteNode("metalCity", position: CGPoint(x: -middleOfTheScreenPoint.x + 410, y: -middleOfTheScreenPoint.y + 350), zPosition: zPosition4th, name: "goldIcon")
            self.addChild(resourceAvailableIcon!)
            
            resourceAvailableLabel = createLabelNode(String(ResourcesData.sharedInstance.metal), position: CGPoint(x: -middleOfTheScreenPoint.x + 480, y: -middleOfTheScreenPoint.y + 332), fontSize: 20, zPosition: zPosition4th, name: "goldAvailableLabel")
            self.addChild(resourceAvailableLabel!)
            
        }
    }
    
    func loadAnimation() {
        
    }
    
    func loadTrain() {
        
    }
    
}