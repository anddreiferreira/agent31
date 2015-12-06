//
//  GunDevelopmentCenterLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

import SpriteKit

class GunDevelopmentCenterLayer: SKNode
{
    
    var background: SKSpriteNode?
    var buttonBack: SKSpriteNode?
    var trainingTitle: SKSpriteNode?
    var tableTraining: SKSpriteNode?
    var areaAnimation: SKSpriteNode?
    var labelGun1: SKLabelNode?
    var labelGun2: SKLabelNode?
    
    override init() {
        
        super.init()
        loadFirstPlan()
        loadSecondPlan()
        loadThirdPlan()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func loadFirstPlan() {
        
        background = createSpriteNode("bgBlur", position: CGPointZero, anchorPoint: CGPointMake(0.5, 0.5), zPosition: 1000, name: "backgroundTraining")
        self.addChild(background!)
        
    }
    
    func loadSecondPlan() {
        
        buttonBack = createSpriteNode("backBtn", position: CGPoint(x: -middleOfTheScreenPoint.x + 20, y: -middleOfTheScreenPoint.y + 370), scale: 0.6, zPosition: 2000, name: "backBtn")
        self.addChild(buttonBack!)
        
        trainingTitle = createSpriteNode("trainingTitle", position: CGPoint(x: -middleOfTheScreenPoint.x + 100, y: -middleOfTheScreenPoint.y + 370), scale: 0.6, zPosition: 2000, name: "trainingTitle")
        self.addChild(trainingTitle!)
        
        tableTraining = createSpriteNode("tableTrain", position: CGPoint(x: -middleOfTheScreenPoint.x + 20.0, y: -middleOfTheScreenPoint.y + 300.0), zPosition: 2000, name: "tableTrain")
        self.addChild(tableTraining!)
        
        areaAnimation = createSpriteNode("animationArea", position: CGPoint(x: -middleOfTheScreenPoint.x + 370, y: -middleOfTheScreenPoint.y + 300), zPosition: 2000, name: "animationArea")
        self.addChild(areaAnimation!)
        
    }
    
    func loadThirdPlan() {
        
        labelGun1 = createLabelNode(GunsData.sharedInstance.gun1Name, position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 245), fontSize: 30, zPosition: 3000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "lblUpgrade gun1")
        self.addChild(labelGun1!)
        
        labelGun2 = createLabelNode(GunsData.sharedInstance.gun2Name, position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 195), fontSize: 30, zPosition: 3000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "lblUpgrade gun2")
        self.addChild(labelGun2!)
        
    }
    
}