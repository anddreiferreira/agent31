//
//  Enemy2.swift
//  Agent 31
//
//  Created by Julio Xavier on 03/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Enemy2: Enemy {

    init(position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = zPositionsCity.ENEMY.rawValue, enemyLevel: Int = 1){
        
        debugPrint("Initializing Enemy 2")
        
        super.init(position: position, withGun: false, gunName: "sword", enemyLevel: enemyLevel)
        
        self.anchorPoint = CGPointMake(0.5, 0.65)
        self.torso?.position = CGPointMake(0.0, -10.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let rectangleSize = CGSizeMake(self.size.width*0.5, self.size.height*0.55)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(rectangleOfSize: rectangleSize, center: CGPointMake(4, -10))
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
        
        self.attackingTorso = actionWithAnimationName("enemy2ShootingTorso", numberOfImages: 3, timePerTexture: 0.1)
        
        self.gotHitTorso = actionWithAnimationName("enemy2GotHitTorso", numberOfImages: 4, timePerTexture: 0.1)
        
    }
}

//MARK: ARTIFICIAL INTELLIGENCE
extension Enemy2{
    override func shoot(){
        self.attacking = true
        self.attackingAnimationOnce()
    
        let initialPosition = CGPointMake(self.position.x + self.size.width/2, self.position.y - self.size.height/8)
        
        let bullet = Bullet(initialPosition: initialPosition, orientation: self.orientation!, zPosition: 5)
        bullet.alpha = 0.0
        self.parent?.addChild(bullet)
    
        bullet.fire()
        
        
        self.runAction(SKAction.waitForDuration(0.1), completion: {
            bullet.removeFromParent()
        })
    }
    
    override func enemyBehaviourAttack() {
        
        turnInAgentDirection()
        
        if(self.distanceToAgent < 70) {
            if(arc4random()%15 + 1 == 1){
                self.shootIfHasBullet()
            }
        }else{
            self.run(self.enemyLevel)
        }
    }
}