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
    
    var attributeName: String?
    var upgradeName: SKLabelNode?
    var upgradeLevel: SKLabelNode?
    var goldAvailableIcon: SKSpriteNode?
    var goldAvailableLabel: SKLabelNode?
    var cancelButton: SKSpriteNode?
    var animationArea: SKSpriteNode?
    var upgradeButton: SKLabelNode?
    var upgradeGoldCost: SKLabelNode?
    var upgradeDuration: SKLabelNode?
    
    init(attributeName: String) {
        
        super.init()
        loadFirstPlan()
        loadSecondPlan(attributeName)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func loadFirstPlan() {
        
        background = createSpriteNode("bgBlur", position: CGPointZero, anchorPoint: CGPointMake(0.5, 0.5), zPosition: 10000, name: "backgroundTraining")
        
    }
    
    func loadSecondPlan(attributeName: String) {
        
        upgradeName = createLabelNode(attributeName, fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 320), fontSize: 40, zPosition: 20000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade attribute")
        
        upgradeLevel = createLabelNode("Level 5", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 275, y: -middleOfTheScreenPoint.y + 320), fontSize: 15, zPosition: 20000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade attribute level")
        
        goldAvailableIcon = createSpriteNode("coinCity", position: CGPoint(x: -middleOfTheScreenPoint.x + 410, y: -middleOfTheScreenPoint.y + 350), zPosition: 20000, name: "goldIcon")
        
        goldAvailableLabel = createLabelNode("2000", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 480, y: -middleOfTheScreenPoint.y + 332), fontSize: 20, zPosition: 20000, name: "goldAvailableLabel")
        
        cancelButton = createSpriteNode("exitButton", position: CGPoint(x: -middleOfTheScreenPoint.x + 570, y: -middleOfTheScreenPoint.y + 355), zPosition: 20000, name: "cancelUpgradeButton")
        
        animationArea = createSpriteNode("animationArea", position: CGPoint(x: -middleOfTheScreenPoint.x + 50, y: -middleOfTheScreenPoint.y + 300), zPosition: 20000, name: "animationArea")
        
        upgradeButton = createLabelNode("TRAIN NOW", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 485, y: -middleOfTheScreenPoint.y + 200), fontSize: 40, zPosition: 20000, name: "btnUpgrade")
        
    }
    
    func loadAnimation() {
        
    }
    
    func loadTrain() {
        
    }
    
    func putUpgradeLayer() {
        // First plan
        self.addChild(background!)
        // Second plan
        self.addChild(upgradeName!)
        self.addChild(upgradeLevel!)
        self.addChild(goldAvailableIcon!)
        self.addChild(goldAvailableLabel!)
        self.addChild(cancelButton!)
        self.addChild(animationArea!)
        self.addChild(upgradeButton!)
    }
}