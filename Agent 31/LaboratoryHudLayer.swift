//
//  HudLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryHudLayer: SKNode {

    private var laboratoryHeaderSprite : SKSpriteNode?
    private var laboratoryHeaderSpriteResources : SKSpriteNode?

    private var laboratoryGoldLabel : SKLabelNode?
    private var laboratoryDiamondLabel : SKLabelNode?
    private var laboratoryMetalLabel : SKLabelNode?
    private var laboratoryTimeLabel : SKLabelNode?
    
    private var laboratoryLifeBar : SKSpriteNode?
    private var messageRaminingLife : SKLabelNode?
    private var timeRemainingLife : SKLabelNode?
    
    override init(){
        
        super.init()
        
        self.loadheader()
        self.loadLabels()
        self.loadLifeBar()
        self.loadMessageLifeBar()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadheader(){
        
        // header
        laboratoryHeaderSprite = createSpriteNode("headerBarLab", position: CGPointMake(20, 375-9), zPosition: 1, name: "headerBarLab")
        laboratoryHeaderSprite?.alpha = 0.3
        
        // resources images
        laboratoryHeaderSpriteResources = createSpriteNode("resourcesLabImages", position: CGPointMake(339, 375-15), zPosition: 2, name: "resourcesLabImages")
        
    }
    
    func loadLabels(){
        
        // label amount gold
        laboratoryGoldLabel = createLabelNode("330", zPosition: 2, position: CGPointMake(380, 338),alignmentMode: SKLabelHorizontalAlignmentMode.Left, fontSize: 28,name: "laboratoryGoldLabel")
        
        // label amount metal
        laboratoryMetalLabel = createLabelNode("5000", zPosition: 2, position: CGPointMake(480, 338),alignmentMode: SKLabelHorizontalAlignmentMode.Left, fontSize: 28,name: "laboratoryGoldLabel")
        
        // label amount diamong
        laboratoryDiamondLabel = createLabelNode("32", zPosition: 2, position: CGPointMake(600, 338),alignmentMode: SKLabelHorizontalAlignmentMode.Left, fontSize: 28,name: "laboratoryGoldLabel")
        
    }
    
    // bar with 5 lives
    func loadLifeBar(){
    
        let livesNumber : Int = 5;
        let livesString = String(livesNumber)
        
        let lifeName : NSMutableString = NSMutableString()
        lifeName.appendString("life")
        lifeName.appendString(livesString)
        
        laboratoryLifeBar = createSpriteNode(lifeName as String, position: CGPointMake(37, 375-16), zPosition: 2, name: "laboratoryLifeBar")
        
    }
    
    // puting all nodes necessary
    func putHudLayer(){
    
        self.addChild(laboratoryHeaderSprite!)
        self.addChild(laboratoryHeaderSpriteResources!)
    
        self.addChild(laboratoryGoldLabel!)
        self.addChild(laboratoryDiamondLabel!)
        self.addChild(laboratoryMetalLabel!)

        self.addChild(laboratoryLifeBar!)
        self.addChild(messageRaminingLife!)

    }

    func loadMessageLifeBar(){
    
        let number : Int = 5
        
        if number == 5 {
            
            messageRaminingLife = createLabelNode("All Lives Availibe", fontName: "Helvetica", position: CGPointMake(90, 323), fontSize: 10, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Center, name: "messageRaminingLife")
        }
//        else{
//        
//            messageRaminingLife = createLabelNode("Time remaining for next life", position: CGPointMake(20, 300), fontName: "Helvetica",fontSize: 10, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Center, name: "messageRaminingLife")
//        
//        }
    
    }
    
    
}
