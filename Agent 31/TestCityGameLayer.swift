//
//  TestCityGameLayer.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class TestCityGameLayer: SKNode {
    
    var agent31 : Agent?
    private var analogStick : AnalogStick?
    
    var jumpButton : SKSpriteNode?
    var shootButton : SKSpriteNode?
    
    
    override init(){
        
        super.init()
        
        self.loadButtons()
        self.configureAnalogStick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButtons(){
        
        jumpButton = createSpriteNode("jumpButton", position: CGPointMake(569, 375-206), zPosition: 3, name: "jumpButton")
        self.addChild(jumpButton!)
        
        shootButton = createSpriteNode("shootButton", position: CGPointMake(479, 375-274), zPosition: 100, name: "shootButton")
        self.addChild(shootButton!)
        
    }

    
    func putGameLayer(){
        self.putGround()
        self.putAgent()
    }
    
    func putGround(){
        let ground = GameObject(imageName: "Ground", position: CGPointMake(667/2, 0), zPosition: 1)
        ground.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.affectedByGravity = false
        self.addChild(ground)
    }
    
    func putAgent(){
        agent31 = Agent()
        self.addChild(agent31!)
    }
    
    private func configureAnalogStick(){
        // Initialize an analog stick
        analogStick = AnalogStick()
        
        analogStick!.trackingHandler = { analogStick in
            
            let xvelocity = analogStick.data.velocity.x
            self.agent31!.changeVelocity(xvelocity)
            
            let yvelocity = analogStick.data.velocity.y
            self.agent31!.lookUp(yvelocity)
            
            
        }
        
        addChild(analogStick!)
    }
    
    func conformAgentToAnalogic(){
        if(self.agent31?.velocity != 0){
            if(self.analogStick?.data.velocity == CGPointZero){
                self.agent31?.changeVelocity(-1)
                self.agent31?.lookUp(0)
            }else{
                self.agent31?.run()
            }
        }
    }

}
