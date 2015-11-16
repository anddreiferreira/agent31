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
    
    var btnSpeed: SKSpriteNode?
    var btnJump: SKSpriteNode?
    var btnShootingPower: SKSpriteNode?
    var btnShootingRange: SKSpriteNode?
    var btnBackpack: SKSpriteNode?
    
    override init() {
        super.init()
        loadtrainingCenter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadtrainingCenter() {
        // Table
        tableTraining = SKSpriteNode(imageNamed: "tableTrain")
        tableTraining!.position = CGPointMake(100, 100)
        tableTraining!.zPosition = 1
        loadLabels()
    }
    
    func loadLabels() {
        // Speed
        labelSpeed = SKLabelNode(text: "Speed")
        labelSpeed!.position = CGPointMake(100, 280)
        labelSpeed!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        labelSpeed!.zPosition = 2
        labelSpeed!.name = "speed"
        // Jump
        labelJump = SKLabelNode(text: "Jump")
        labelJump!.position = CGPointMake(100, 230)
        labelJump!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        labelJump!.zPosition = 2
        labelJump!.name = "jump"
        // Shooting Power
        labelShootingPower = SKLabelNode(text: "Shooting Power")
        labelShootingPower!.position = CGPointMake(100, 180)
        labelShootingPower!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        labelShootingPower!.zPosition = 2
        labelShootingPower!.name = "shootingPower"
        // Shooting Range
        labelShootingRange = SKLabelNode(text: "Shooting Range")
        labelShootingRange!.position = CGPointMake(100, 130)
        labelShootingRange!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        labelShootingRange!.zPosition = 2
        labelShootingRange!.name = "shootingRange"
        // Backpack
        labelBackpack = SKLabelNode(text: "Backpack")
        labelBackpack!.position = CGPointMake(100, 80)
        labelBackpack!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        labelBackpack!.zPosition = 2
        labelBackpack!.name = "backpack"
    }
    
    func putTrainingCenterLayer() {
        addChild(tableTraining!)
        addChild(labelSpeed!)
        addChild(labelJump!)
        addChild(labelShootingPower!)
        addChild(labelShootingRange!)
        addChild(labelBackpack!)
    }
    
}