//
//  Enemy1.swift
//  Agent 31
//
//  Created by Julio Xavier on 03/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Enemy1: Enemy {
    
    override init(position: CGPoint = middleOfTheScreenPoint, withGun: Bool = true, gunName: String = "enemy1Gun", enemyLevel: Int = 1){
        
        debugPrint("Initializing Enemy 1")
        
        
        super.init(position: position, withGun: withGun, gunName: gunName, enemyLevel: enemyLevel)
        
        self.torso?.position = CGPointMake(0.0, -3.4)
        
        setGeneralAttributesForEnemy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForEnemy(){
        bulletFrequency()
        stoppedAnimationForever()
        self.setEnemyPhysics()
        
//        self.HP = HPAccordingToLevel()
        
        self.HP = 1000
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

// MARK: PHYSICS
extension Enemy1{
    private func setEnemyPhysics(){
        self.physicsBody?.categoryBitMask = ColliderType.Enemy.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.Ground.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.Ground.rawValue
    }
}

// MARK: ARTIFICAL INTELLIGENCE
extension Enemy1{
    
    override func enemyBehaviourAttack() {
        
        turnInAgentDirection()
        
        shootIfHasBullet()
        
        if( self.distanceToAgent > 100 ) {
            if(self.distanceToAgent < 200){
                
                if(rand()%2+1 == 1){
                    shootIfHasBullet()
                }else{
                    // Do nothing
                }
                
            }else{
                self.run(self.enemyLevel)
            }
            
        }
    }
    
    override func enemyBehaviourGuarding() {
        
    }
    
    override func setDistanceToAgent(agentPosition: CGPoint) {
        
        self.agentPos = agentPosition
        self.distanceToAgent = distanceBetweenPoints( self.position, second: agentPosition )
    }
    
    
}
