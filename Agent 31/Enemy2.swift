//
//  Enemy2.swift
//  Agent 31
//
//  Created by Julio Xavier on 03/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Enemy2: Enemy {

    init(position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0, enemyLevel: Int = 1){
        
        debugPrint("Initializing Enemy 2")
        
        super.init(position: position, zPosition: 1.0, withGun: false, gunName: "sword", enemyLevel: enemyLevel)
        
        self.anchorPoint = CGPointMake(0.5, 0.65)
        self.torso?.position = CGPointMake(0.0, -10.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let rectangleSize = CGSizeMake(self.size.width*0.4, self.size.height*0.55)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(rectangleOfSize: rectangleSize, center: CGPointMake(0, -10))
        physicsBody.affectedByGravity = true
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        return physicsBody
    }
}

// MARK: ANIMATIONS
extension Enemy2{
    override func initializeAnimations(){
        
        self.stoppedTorso = actionWithAnimationName("enemy2StoppedTorso", numberOfImages: 6, timePerTexture: 0.15)
        self.stoppedLegs = actionWithAnimationName("enemy2StoppedLegs", numberOfImages: 6, timePerTexture: 0.15)
        
        self.jumpingLegs = actionWithAnimationName("enemy2JumpingLegs", numberOfImages: 6, timePerTexture: 0.1)
        self.jumpingTorso = actionWithAnimationName("enemy2JumpingTorso", numberOfImages: 6, timePerTexture: 0.1)
        
        self.walkingTorso = actionWithAnimationName("enemy2WalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.walkingLegs = actionWithAnimationName("enemy2WalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.runningTorso = actionWithAnimationName("enemy2WalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.runningLegs = actionWithAnimationName("enemy2WalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.attackingTorso = actionWithAnimationName("enemy2ShootingTorso", numberOfImages: 3, timePerTexture: 1.0)
        
        self.gotHitTorso = actionWithAnimationName("enemy2GotHitTorso", numberOfImages: 4, timePerTexture: 0.1)
        
    }
}

//MARK: ARTIFICIAL INTELLIGENCE
extension Enemy2{
    override func shoot(){
            self.attacking = true
            self.attackingAnimationOnce()
        
    }
}