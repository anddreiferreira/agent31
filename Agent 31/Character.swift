//
//  Character.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Character: GameObject {
    
    var runningAnimation: SKAction?
    var idleAnimation: SKAction?
    var jumpAnimation: SKAction?
    var gotHitAnimation: SKAction?
    
    override init(imageName: String = "1", position: CGPoint = middleOfTheScreenPoint, scale: CGFloat = 0.5, zPosition: CGFloat = 1.0){
        
        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition)
        
        setGeneralAttributesForCharacter()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForCharacter(){
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.mass = 1.0
        initializeAnimations()
    }
    
    func initializeAnimations(){
        self.runningAnimation = nil
        self.idleAnimation = nil
        self.jumpAnimation = nil
        self.gotHitAnimation = nil
    }
    
    func jump(){
        self.runAction(self.jumpAnimation!)
        self.physicsBody?.applyImpulse(CGVectorMake(0, 400))
    }
   
}
