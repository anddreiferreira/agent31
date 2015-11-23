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
    
    init(position: CGPoint, zPosition: CGFloat = 1.0){
        
        // Randomize a value between 10 and 1
        self.value = Int(arc4random() % 10 + 1)
        
        super.init(imageName: "Coin", position: position, zPosition: zPosition)
        
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
        
        return physicsBody
    }
    
    func basicProcedures(){
        self.runAction(SKAction.waitForDuration(8.0), completion: {
            self.removeFromParent()
        })
    }
    
    func attributes(){
        self.setScale(0.3)
    }
    
}
