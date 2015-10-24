//
//  Character.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Character: GameObject {
    
    var torso: SKSpriteNode?
    var walkingTorso: SKAction?
    var walkingLegs: SKAction?
    var attackingUpTorso: SKAction?
    var attackingTorso: SKAction?
    var stoppedTorso: SKAction?
    var jumpingLegs: SKAction?
    var jumpingTorso: SKAction?
    var getHitTorso: SKAction?
    var getHitLegs: SKAction?
    
    init(legsImage: String, torsoImage: String, position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0){
        
        super.init(imageName: legsImage, position: position, zPosition: zPosition)
        
        let torsoTexture: SKTexture = generateTextureWithImage(torsoImage)
        self.torso = SKSpriteNode(texture: torsoTexture)
        
        self.addChild(torso!)
        
        setGeneralAttributesForCharacter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForCharacter(){
        self.setScale(4.0)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.mass = 1.0
        self.physicsBody?.restitution = 0.0
        initializeAnimations()
    }
    
    func initializeAnimations(){
        
        
        self.walkingTorso = nil
        self.walkingLegs = nil
        
        self.attackingUpTorso = nil
        self.attackingTorso = nil
        
        self.stoppedTorso = nil
        
        self.jumpingLegs = nil
        self.jumpingTorso = nil
        
        self.getHitTorso = nil
        self.getHitLegs = nil
        
    }
    
    func jump(){
        
        jumpAnimationOnce()
        self.physicsBody?.applyImpulse(CGVectorMake(0, 400))
    }
    
    func stoppedAnimationForever(){
        self.torso?.runAction(SKAction.repeatActionForever(self.stoppedTorso!))
    }
    
    func jumpAnimationOnce(){
        if(self.jumpingTorso != nil && self.jumpingLegs != nil){
            self.runAction(self.jumpingLegs!)
            self.torso?.runAction(self.jumpingTorso!)
        }
    }
    
    func walkingAnimationOnce(){
        if(self.walkingLegs != nil && self.walkingTorso != nil){
            self.torso?.runAction(self.walkingTorso!)
            self.runAction(self.walkingLegs!)
        }
    }
   
}
