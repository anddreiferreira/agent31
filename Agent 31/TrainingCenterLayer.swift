//
//  TrainingCenterLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation
import SpriteKit

class TrainingCenterLayer: SKNode
{
    var trainingCenter: SKSpriteNode?
    var tableTraining: SKSpriteNode?
    var labelSpeed: SKLabelNode?
    var labelJump: SKLabelNode?
    var labelShootingPower: SKLabelNode?
    var labelShootingRange: SKLabelNode?
    var labelBackpack: SKLabelNode?
    var areaAnimation: SKSpriteNode?
    var buttonBack: SKSpriteNode?
    var trainingTitle: SKSpriteNode?
    
    override init() {
        super.init()
        loadHeader()
        loadElements()
        loadLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadHeader() {
        
        buttonBack = createSpriteNode("backBtnTrain", position: CGPoint(x: -middleOfTheScreenPoint.x + 20, y: -middleOfTheScreenPoint.y + 350), scale: 0.6, zPosition: 2000, name: "btnBackTrain")
        
        trainingTitle = createSpriteNode("trainingTitle", position: CGPoint(x: -middleOfTheScreenPoint.x + 100, y: -middleOfTheScreenPoint.y + 370), scale: 0.6, zPosition: 2000, name: "trainingTitle")
    }
    
    func loadElements() {
        
        tableTraining = createSpriteNode("tableTrain", position: CGPoint(x: -middleOfTheScreenPoint.x + 20.0, y: -middleOfTheScreenPoint.y + 300.0), zPosition: 1000, name: "tableTrain")
        
        areaAnimation = createSpriteNode("animationArea", position: CGPoint(x: -middleOfTheScreenPoint.x + 370, y: -middleOfTheScreenPoint.y + 300), zPosition: 2000, name: "animationArea")
    }
    
    func loadLabels() {
        
        labelSpeed = createLabelNode("Speed", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 245), fontSize: 30, zPosition: 2000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade speed")
        
        labelJump = createLabelNode("Jump", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 195), fontSize: 30, zPosition: 2000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade jump")
        
        labelShootingPower = createLabelNode("Shooting Power", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 145), fontSize: 30, zPosition: 2000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade shootingPower")
        
        labelShootingRange = createLabelNode("Shooting Range", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 95), fontSize: 30, zPosition: 2000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade shootingRange")
        
        labelBackpack = createLabelNode("Backpack", fontName: "CopperplateBlackCondensedSSi", position: CGPoint(x: -middleOfTheScreenPoint.x + 70, y: -middleOfTheScreenPoint.y + 45), fontSize: 30, zPosition: 2000, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "upgrade backpack")
    }
    
    func putTrainingCenterLayer() {
        // Elements
        self.addChild(tableTraining!)
        self.addChild(areaAnimation!)
        self.addChild(buttonBack!)
        self.addChild(trainingTitle!)
        // Labels
        self.addChild(labelSpeed!)
        self.addChild(labelJump!)
        self.addChild(labelShootingPower!)
        self.addChild(labelShootingRange!)
        self.addChild(labelBackpack!)
    }
    
}