//
//  HudLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryHudLayer: SKNode {

    private var laboratoryGoldLabel : SKLabelNode?
    private var laboratoryDiamondLabel : SKLabelNode?
    private var laboratoryMetalLabel : SKLabelNode?
    private var laboratoryTimeLabel : SKLabelNode?
    
    var laboratoryHeaderSprite : SKSpriteNode?
    
    var laboratoryLife : SKSpriteNode?
    
    override init(){
        
        super.init()
        
        self.loadLabels()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadLabels(){
        
        laboratoryGoldLabel = createLabelNode("21", position: CGPointMake(350, 350),name: "laboratoryGoldLabel")
        
    }
    
    func putHudLayer(){
    
        self.addChild(laboratoryGoldLabel!)
    
    }

    
    
}
