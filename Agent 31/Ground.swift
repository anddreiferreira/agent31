//
//  Ground.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Ground: GameObject {
    
    override init(imageName: String, position: CGPoint, scale: CGFloat = 1.0, zPosition: CGFloat) {
        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition)
        self.name = "Ground"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func generatePhysicsBody() -> SKPhysicsBody {
        let physicsBody = super.generatePhysicsBody()
        
        physicsBody.categoryBitMask = ColliderType.Ground.rawValue
        physicsBody.contactTestBitMask = ColliderType.Agent.rawValue | ColliderType.Coin.rawValue | ColliderType.Metal.rawValue
        physicsBody.dynamic = false
        physicsBody.affectedByGravity = false
        
        return physicsBody
    }
}
