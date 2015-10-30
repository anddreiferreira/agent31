//
//  TestCityGameLayer.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class TestCityGameLayer: SKNode {
    var jumpButton : SKSpriteNode?
    var shootingButton : SKSpriteNode?
    
    
    override init(){
        
        super.init()
        
        self.loadButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButtons(){
        
        jumpButton = createSpriteNode("jumpButton", position: CGPointMake(537, 375-274), zPosition: 3, name: "jumpButton")
        self.addChild(jumpButton!)
        
    }
    
    func putGameLayer(){
        
        
    }

}
