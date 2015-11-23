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
        buttonBack = createSpriteNode("backBtnTrain", position: CGPoint(x: 10, y: 365), scale: 0.6, name: "btnBackTrain")
        trainingTitle = createSpriteNode("trainingTitle", position: CGPoint(x: 100, y: 370), scale: 0.6, name: "trainingTitle")
    }
    
    func loadElements() {
        tableTraining = createSpriteNode("tableTrain", position: CGPoint(x: 20, y: 300), name: "tableTrain")
        areaAnimation = createSpriteNode("animationArea", position: CGPoint(x: 370, y: 300), name: "animationArea")
    }
    
    func loadLabels() {
        labelSpeed = createLabelNode("Speed", fontName: "CopperplateBlackCondensedSSi", position: CGPointMake(70, 245), fontSize: 30, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "speed")
        labelJump = createLabelNode("Jump", fontName: "CopperplateBlackCondensedSSi", position: CGPointMake(70, 195), fontSize: 30, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "jump")
        labelShootingPower = createLabelNode("Shooting Power", fontName: "CopperplateBlackCondensedSSi", position: CGPointMake(70, 145), fontSize: 30, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "shootingPower")
        labelShootingRange = createLabelNode("Shooting Range", fontName: "CopperplateBlackCondensedSSi", position: CGPointMake(70, 95), fontSize: 30, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "shootingRange")
        labelBackpack = createLabelNode("Backpack", fontName: "CopperplateBlackCondensedSSi", position: CGPointMake(70, 45), fontSize: 30, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Left, name: "backpack")
    }
    
    func loadAttributeForUpgrade(attributeName: String) {
        /*
        let attributeForUpgrade = createSpriteNode("bgBlur", anchorPoint: CGPoint(x: 0, y: 0), name: "attributeForUpgrade")
        addChild(attributeForUpgrade)
        
        let attributeNameForUpgrade = createLabelNode(attributeName, fontName: "CopperplateBlackCondensedSSi", name: "attributeNameForUpgrade")
        attributeForUpgrade.addChild(attributeNameForUpgrade)
        */
    }
    
    func putTrainingCenterLayer() {
        // Elements
        addChild(tableTraining!)
        addChild(areaAnimation!)
        addChild(buttonBack!)
        addChild(trainingTitle!)
        // Labels
        addChild(labelSpeed!)
        addChild(labelJump!)
        addChild(labelShootingPower!)
        addChild(labelShootingRange!)
        addChild(labelBackpack!)
    }
    
}