//
//  Ground.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode {
    
//    override init(imageName: String, position: CGPoint, scale: CGFloat = 1.0, zPosition: CGFloat) {
//        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition)
//        self.name = "Ground"
//    }
    
    /**
    USED ONLY FOR GROUND
    */
    init(size: CGSize, position: CGPoint, zPosition: CGFloat){
        super.init(texture: nil, color: UIColor.yellowColor(), size: size)
        self.position = position
        self.zPosition = zPosition
        self.alpha = 0.0
        self.setScale(1.0)
        
        setBasicAttributes()
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBasicAttributes(){
        self.physicsBody = generatePhysicsBody()
    }

    func generatePhysicsBody() -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        
        physicsBody.categoryBitMask = ColliderType.Ground.rawValue
        physicsBody.contactTestBitMask = ColliderType.Agent.rawValue | ColliderType.Coin.rawValue | ColliderType.Metal.rawValue
        physicsBody.dynamic = false
        physicsBody.affectedByGravity = false
        
        return physicsBody
    }
}
