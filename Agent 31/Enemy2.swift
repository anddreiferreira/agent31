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
        
        debugPrint("Initializing Enemy")
        
        
        super.init(position: position, zPosition: 1.0, withGun: false, gunName: "sword", enemyLevel: enemyLevel)
        
        self.torso?.position = CGPointMake(0.0, -3.4)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: ANIMATIONS
extension Enemy1{
    override func initializeAnimations(){
        self.stoppedTorso = actionWithAnimationName("enemy1StoppedTorso", numberOfImages: 6, timePerTexture: 0.15)
        self.stoppedLegs = actionWithAnimationName("enemy1StoppedLegs", numberOfImages: 6, timePerTexture: 0.15)
        
        self.jumpingLegs = actionWithAnimationName("enemy1JumpingLegs", numberOfImages: 6, timePerTexture: 0.1)
        self.jumpingTorso = actionWithAnimationName("enemy1JumpingTorso", numberOfImages: 6, timePerTexture: 0.1)
        
        self.walkingTorso = actionWithAnimationName("enemy1WalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.walkingLegs = actionWithAnimationName("enemy1WalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.runningTorso = actionWithAnimationName("enemy1WalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.runningLegs = actionWithAnimationName("enemy1WalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.lookingUpTorso = actionWithAnimationName("enemy1ShootingUpTorso", numberOfImages: 1, timePerTexture: 0.3)
        self.attackingUpTorso = actionWithAnimationName("enemy1ShootingUpTorso", numberOfImages: 3, timePerTexture: 0.08)
        self.attackingTorso = actionWithAnimationName("enemy1ShootingTorso", numberOfImages: 3, timePerTexture: 0.08)
        
        self.gotHitTorso = actionWithAnimationName("enemy1GotHitTorso", numberOfImages: 4, timePerTexture: 0.1)
        
    }
}