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
        testEnemy.name = "enemy"
        self.addChild(testEnemy)
    }
    
    func updateEnemy(currentTime: NSTimeInterval){
        self.enumerateChildNodesWithName("enemy", usingBlock: {
            node, stop in
            // Block below is executed if a enemy is found
            
            if let foundEnemy = node as? GeneralEnemy{
                
                foundEnemy.update(currentTime)
                
            }else{
                debugPrint("Enemy isn't found")
            }
            
        })
    }

}

// MARK: CONTACT
extension TestCityGameLayer{
    func didBeginContact(contact: SKPhysicsContact){
        
        
        let node1: SKNode = contact.bodyA.node!
        let node2: SKNode = contact.bodyB.node!
        
        if(node1.isKindOfClass(Bullet)){
            let bullet = (node1 as? Bullet)!
            bullet.hittedSomething()
            if(node2.isKindOfClass(Character)){
                let charac = (node2 as? Character)!
                charac.gotHit(bullet.damage)

            }
        }else if(node2.isKindOfClass(Bullet)){
            let bullet = (node2 as? Bullet)!
            bullet.hittedSomething()
            if(node1.isKindOfClass(Character)){
                let charac = (node1 as? Character)!
                charac.gotHit(bullet.damage)
                
            }
        }
    }
    
    func didEndContact(contact: SKPhysicsContact){
        
//        let node1: SKNode = contact.bodyA.node!
//        let node2: SKNode = contact.bodyB.node!
    }
    
}
