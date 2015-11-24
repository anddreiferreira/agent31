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
    var backgroundUpgrade: SKSpriteNode?
    var attributeName: String?
    var upgradeName: SKLabelNode?
    var upgradeLevel: SKLabelNode?
    var goldAvailableIcon: SKSpriteNode?
    var goldAvailableLabel: SKLabelNode?
    var cancelButton: SKSpriteNode?
    var animationArea: SKSpriteNode?
    var upgradeButton: SKSpriteNode?
    var upgradeGoldCost: SKLabelNode?
    var upgradeDuration: SKLabelNode?
    
    //override init(name: String) {
    init(attributeName: String) {
        super.init()
        
        loadBackgroundUpgrade()
        loadHeader(attributeName)
        loadAnimation()
        loadTrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //func createLabelNode(text: String, fontName: String = defaultFontName, position: CGPoint = middleOfTheScreenPoint, fontSize: CGFloat = 32.0, color: SKColor = SKColor.whiteColor(), zPosition: CGFloat = 1.0, alignmentMode: SKLabelHorizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center,name: String) -> SKLabelNode { }
    //func createSpriteNode(imageName: String, position: CGPoint = middleOfTheScreenPoint, anchorPoint: CGPoint = defaultAnchorPoint, scale: CGFloat = 0.5, zPosition: CGFloat = 1.0, name: String) -> SKSpriteNode { }
    
    
    func loadBackgroundUpgrade() {
        backgroundUpgrade = createSpriteNode("bgBlur", anchorPoint: CGPointMake(0.5,0), scale: 1.0, zPosition: 2000, position: CGPointMake(0, 0),name: "backgroundUpgrade")
    }
    
    func loadHeader(attributeName: String) {
        upgradeName = createLabelNode(attributeName, fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 20, y: -middleOfTheScreenPoint.y + 300), fontSize: 30, zPosition: 3000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade attribute")
        upgradeLevel = createLabelNode("Level 5", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 20, y: -middleOfTheScreenPoint.y + 250), fontSize: 15, zPosition: 3000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade attribute level")
        //goldAvailableIcon = createSpriteNode()
        //goldAvailableLabel = createLabelNode()
        cancelButton = createSpriteNode("exitButton", position: CGPoint(x: -middleOfTheScreenPoint.x + 400, y: -middleOfTheScreenPoint.y + 300), zPosition: 3000, name: "cancelUpgradeButton")
    }
    
    func loadAnimation() {
        
    }
    
    func loadTrain() {
        
    }
    
    func putUpgradeLayer() {
        self.addChild(backgroundUpgrade!)
        self.addChild(upgradeName!)
        self.addChild(upgradeLevel!)
        self.addChild(cancelButton!)
    }
}