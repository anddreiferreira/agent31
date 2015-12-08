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
        
        if CharacterData.sharedInstance.isTrainingNow == false {
            upgradeButton = createLabelNode("TRAIN NOW", position: CGPoint(x: -middleOfTheScreenPoint.x + 485, y: -middleOfTheScreenPoint.y + 200), fontSize: 40, zPosition: zPosition4th, name: "btnDoUpgrade" + upgradeItem!)
        } else {
            upgradeButton = createLabelNode("Upgrading", position: CGPoint(x: -middleOfTheScreenPoint.x + 485, y: -middleOfTheScreenPoint.y + 200), fontSize: 40, zPosition: zPosition4th, name: "btnDoNotUpgrade")
        }
        self.addChild(upgradeButton!)
        
        upgradeDuration = createLabelNode("", position: CGPoint(x: -middleOfTheScreenPoint.x + 485, y: -middleOfTheScreenPoint.y + 180), fontSize: 15, zPosition: zPosition4th, name: "lblUpgradeDuration")
        self.addChild(upgradeDuration!)
        
    }
    
    func loadAttributeName(attributeName: String) {
        
        upgradeName = createLabelNode(attributeName, position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 330), fontSize: 40, zPosition: zPosition4th, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "lblDoUpgrade")
        self.addChild(upgradeName!)
        
    }
    
    func loadAttributeLevel(attributeName: String) {
        
        var attributeLevel = 0
        
        switch attributeName {
        case "Speed":
            attributeLevel = CharacterData.sharedInstance.speed
        case "Jump":
            attributeLevel = CharacterData.sharedInstance.jump
        case "Shoot. Power":
            attributeLevel = CharacterData.sharedInstance.shootingPower
        case "Shoot. Range":
            attributeLevel = CharacterData.sharedInstance.shootingRange
        case "Backpack":
            attributeLevel = CharacterData.sharedInstance.backPack
        case GunsData.sharedInstance.gun1Name:
            attributeLevel = GunsData.sharedInstance.gun1Level
        case GunsData.sharedInstance.gun2Name:
            attributeLevel = GunsData.sharedInstance.gun2Level
        default: ()
            
        }
        
        upgradeLevel = createLabelNode("Level " + String(attributeLevel), position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 310), fontSize: 15, zPosition: zPosition4th, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "lblLevel")
        self.addChild(upgradeLevel!)
        
    }
    
    func loadResourceType(resourceType: String) {
        
        if resourceType == "ouro" {
            
            resourceAvailableIcon = createSpriteNode("coinCity", position: CGPoint(x: -middleOfTheScreenPoint.x + 410, y: -middleOfTheScreenPoint.y + 350), zPosition: zPosition4th, name: "goldIcon")
            self.addChild(resourceAvailableIcon!)
            
            resourceAvailableLabel = createLabelNode(String(ResourcesData.sharedInstance.gold), position: CGPoint(x: -middleOfTheScreenPoint.x + 480, y: -middleOfTheScreenPoint.y + 332), fontSize: 20, zPosition: zPosition4th, name: "lblGoldAvailable")
            self.addChild(resourceAvailableLabel!)
            
        } else if resourceType == "metal" {
            
            resourceAvailableIcon = createSpriteNode("metalCity", position: CGPoint(x: -middleOfTheScreenPoint.x + 410, y: -middleOfTheScreenPoint.y + 350), zPosition: zPosition4th, name: "goldIcon")
            self.addChild(resourceAvailableIcon!)
            
            resourceAvailableLabel = createLabelNode(String(ResourcesData.sharedInstance.metal), position: CGPoint(x: -middleOfTheScreenPoint.x + 480, y: -middleOfTheScreenPoint.y + 332), fontSize: 20, zPosition: zPosition4th, name: "lblGoldAvailable")
            self.addChild(resourceAvailableLabel!)
            
        }
    }
    
}