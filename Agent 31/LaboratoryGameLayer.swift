//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {

    var agent31Lab : Agent?

    var jumpButtonLab : SKSpriteNode?
    
    override init(){
        
        super.init()
        
        self.loadButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButtons(){
    
        jumpButtonLab = createSpriteNode("jumpButton", position: CGPointMake(575, 375-291), zPosition: 2, name: "jumpButtonLab")
    
    }
    
    func putGameLayer(){
        
        self.addChild(jumpButtonLab!)
        
    }
    
    
    
}
