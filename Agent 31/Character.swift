//
//  Character.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Character: GameObject {
    
    var tronco: SKSpriteNode?
    var runningAnimation: SKAction?
    var idleAnimation: SKAction?
    var jumpAnimation: SKAction?
    var gotHitAnimation: SKAction?
    
    init(legsImage: String, torsoImage: String, position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0){
        
        super.init(imageName: legsImage, position: position, zPosition: zPosition)
        
        let troncoTexture: SKTexture = generateTextureWithImage(torsoImage)
        self.tronco = SKSpriteNode(texture: troncoTexture)
        
        self.addChild(tronco!)
        
        setGeneralAttributesForCharacter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForCharacter(){
        self.setScale(4.0)
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
//        self.runAction(self.jumpAnimation!)
        self.physicsBody?.applyImpulse(CGVectorMake(0, 400))
    }
   
}
