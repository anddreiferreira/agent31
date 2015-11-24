//
//  Metal.swift
//  Agent 31
//
//  Created by Julio Xavier on 23/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Metal: GameObject {
    
    var value: Int
    
    init(position: CGPoint, zPosition: CGFloat = 1.0){
        
        // Randomize a value between 10 and 1
        self.value = Int(arc4random() % 10 + 1)
        
        super.init(imageName: "Metal", position: position, zPosition: zPosition)
        
        attributes()
        basicProcedures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        physicsBody.categoryBitMask = ColliderType.Metal.rawValue
        physicsBody.collisionBitMask = ColliderType.Agent.rawValue | ColliderType.Ground.rawValue
        physicsBody.contactTestBitMask = physicsBody.collisionBitMask
        physicsBody.mass = 0.1
        
        return physicsBody
    }
    
    func basicProcedures(){
        
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
    
    
}
