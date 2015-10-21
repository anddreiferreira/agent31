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
    
    var laboratoryLife : SKSpriteNode?
    
    override init(){
        
        super.init()
        
        self.loadheader()
        self.loadLabels()
        
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
        laboratoryGoldLabel = createLabelNode("330", zPosition: 2, position: CGPointMake(380, 336),name: "laboratoryGoldLabel")
        
        // label amount metal
        laboratoryMetalLabel = createLabelNode("5000", zPosition: 2, position: CGPointMake(350, 336),name: "laboratoryMetalLabel")
        
        // label amount diamong
        laboratoryDiamondLabel = createLabelNode("32", zPosition: 2, position: CGPointMake(380, 336),name: "laboratoryDiamondLabel")
        
    }
    
    // puting all nodes necessary
    func putHudLayer(){
    
        self.addChild(laboratoryGoldLabel!)
        self.addChild(laboratoryHeaderSprite!)
        self.addChild(laboratoryHeaderSpriteResources!)
    
    }

    
    
}
