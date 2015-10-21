//
//  HudLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryHudLayer: SKNode {

    var laboratoryGoldLabel : SKLabelNode?
    var laboratoryDiamondLabel : SKLabelNode?
    var laboratoryMetalLabel : SKLabelNode?
    var laboratoryTimeLabel : SKLabelNode?
    
    var laboratoryHeaderSprite : SKSpriteNode?
    
    var laboratoryLife : SKSpriteNode?
    
    init(positionRec: CGPoint, pointsRec: Int = 0){
        
        super.init()
        
        self.position = positionRec
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
}
