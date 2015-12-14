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
    
    init(position: CGPoint){
        
        // Randomize a value between 10 and 1
        self.value = Int(arc4random() % 10 + 1)
        self.spinning = actionWithAnimationName("Coin", numberOfImages: 6, timePerTexture: 0.1)
        
        super.init(imageName: "Coin1", position: position, zPosition: zPositionsCity.RESOURCE.rawValue)
        
        attributes()
        basicProcedures()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/4)

        physicsBody.categoryBitMask = ColliderType.Coin.rawValue
        physicsBody.contactTestBitMask = ColliderType.Agent.rawValue
        physicsBody.collisionBitMask = ColliderType.Ground.rawValue

        physicsBody.allowsRotation = false
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
