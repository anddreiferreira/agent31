//
//  TrainingCenterLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

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
        // Speed label
        labelSpeed = SKLabelNode(fontNamed: "Cooperplate")
        labelSpeed!.text = "Speed"
        labelSpeed!.fontSize = 30
        labelSpeed!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        // Jump label
        labelJump = SKLabelNode(fontNamed: "Cooperplate")
        labelJump!.text = "Jump"
        labelJump!.fontSize = 30
        labelJump!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        // Shooting power label
        labelShootingPower = SKLabelNode(fontNamed: "Cooperplate")
        labelShootingPower!.text = "Shooting Power"
        labelShootingPower!.fontSize = 30
        labelShootingPower!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        // Shooting range label
        labelShootingRange = SKLabelNode(fontNamed: "Cooperplate")
        labelShootingRange!.text = "Shooting range"
        labelShootingRange!.fontSize = 30
        labelShootingRange!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        // Backpack label
        labelBackpack = SKLabelNode(fontNamed: "Cooperplate")
        labelBackpack!.text = "Backpack"
        labelBackpack!.fontSize = 30
        labelBackpack!.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        debugPrint("Load Training Center layer")
    }
    
    func putTrainingCenterLayer() {
        //addChild(trainingCenter!)
        addChild(tableTraining!)
        addChild(labelSpeed!)
        addChild(labelJump!)
        addChild(labelShootingPower!)
        addChild(labelShootingRange!)
        addChild(labelBackpack!)
    }
    
}