//
//  Coin.swift
//  Agent 31
//
//  Created by Julio Xavier on 23/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Coin: GameObject {

    var value: Int
    var spinning: SKAction
    
    init(position: CGPoint, zPosition: CGFloat = 1.0){
        
        // Randomize a value between 10 and 1
        self.value = Int(arc4random() % 10 + 1)
        self.spinning = actionWithAnimationName("Coin", numberOfImages: 6, timePerTexture: 0.1)
        
        super.init(imageName: "Coin1", position: position, zPosition: zPosition)
        
        attributes()
        basicProcedures()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2)
        physicsBody.categoryBitMask = ColliderType.Coin.rawValue
        physicsBody.collisionBitMask = ColliderType.Agent.rawValue | ColliderType.Ground.rawValue
        physicsBody.contactTestBitMask = physicsBody.collisionBitMask
        physicsBody.mass = 0.1
        
        return physicsBody
    }
    
    func basicProcedures(){
        
        self.runAction(SKAction.repeatActionForever(self.spinning))
        
        // random between left and right direction
        let dx = CGFloat(random() % 40 - 40)
        self.physicsBody?.applyImpulse(CGVectorMake(dx, 200))
        
        self.runAction(SKAction.waitForDuration(8.0), completion: {
            self.removeFromParent()
        })
    }
    
    func attributes(){
        self.setScale(0.5)
    }
    
    override func didBeginContact(contactedNode: SKNode) {
        if contactedNode .isKindOfClass(Agent){
            ResourcesData.sharedInstance.gold += self.value
            self.removeFromParent()
        }
    }
    
}
