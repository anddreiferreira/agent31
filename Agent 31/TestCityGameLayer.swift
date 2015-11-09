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
    
    override init(){
        
        super.init()
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    
    func putGameLayer(){
        self.putGround()
        self.putAgent()
        self.putTestEnemy()
        
        createBlock(CGPointMake(middleOfTheScreenPoint.x/2, middleOfTheScreenPoint.y))
        createBlock(CGPointMake(middleOfTheScreenPoint.x*2, middleOfTheScreenPoint.y*2))
    }
    
    func putGround(){
        let ground = GameObject(imageName: "testCityGround", position: CGPointMake(middleOfTheScreenPoint.x, 0), zPosition: 1)
        ground.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.affectedByGravity = false
        self.addChild(ground)
    }
    
    func createBlock(position: CGPoint){
        let block = GameObject(imageName: "testCityBlock", position: position, zPosition: 1)
        block.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        block.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue
        block.physicsBody?.dynamic = false
        block.physicsBody?.affectedByGravity = false
        block.yScale = (block.yScale)/2
        self.addChild(block)
    }
    
    func putAgent(){
        agent31 = Agent(position: CGPointMake(middleOfTheScreenPoint.x, middleOfTheScreenPoint.y/3))
        self.addChild(agent31!)
    }
    
    func putTestEnemy(){
        let testEnemy = GeneralEnemy(position: CGPointMake(middleOfTheScreenPoint.x + 100, middleOfTheScreenPoint.y))
        self.addChild(testEnemy)
    }
    


}
