//
//  ComputerLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class ComputerLayer: SKNode
{

    var background: SKSpriteNode?
    
    override init() {
        
        super.init()
        loadFirstPlan()
        loadSecondPlan()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadFirstPlan() {
        
        background = createSpriteNode("bgBlur", position: CGPointZero, anchorPoint: CGPointMake(0.5, 0.5), zPosition: 1000, name: "backgroundTraining")
        self.addChild(background!)
        
    }
    
    func loadSecondPlan() {
        
    }
    
}