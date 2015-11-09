//
//  Enemy.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GeneralEnemy: Character {
    
    private let initialLegs: String = "pernasParado1"
    private let initialTorso: String = "troncoParado1"
    
//    override init(legsImage: String, torsoImage: String, position: CGPoint, zPosition: CGFloat) {
//        super.init(legsImage: legsImage, torsoImage: torsoImage, position: position, zPosition: zPosition)
//        
//        // While using test sprites
//        self.color = SKColor.redColor()
//        
//        setGeneralAttributesForGeneralEnemy()
//    }
    
    init(position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0){
        
        debugPrint("Initializing Enemy")
        
        super.init(legsImage: initialLegs, torsoImage: initialTorso, position: position, zPosition: 1.0)
        
        colorizeEnemy(SKColor.redColor())
        
        setGeneralAttributesForGeneralEnemy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForGeneralEnemy(){
        stoppedAnimationForever()
        self.setGeneralEnemyPhysics()
    }
    
    private func setGeneralEnemyPhysics(){
        self.physicsBody?.categoryBitMask = ColliderType.Enemy.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue | ColliderType.Ground.rawValue
    }
    
    private func colorizeEnemy(color: SKColor){
        self.color = color
        self.torso?.color = color
        
        self.colorBlendFactor = 0.5
        self.torso?.colorBlendFactor = 0.5
    }
    
    override func initializeAnimations(){
        self.stoppedTorso = actionWithAnimationName("troncoParado", numberOfImages: 4, timePerTexture: 0.25)
        self.stoppedLegs = actionWithAnimationName("pernasParado", numberOfImages: 1, timePerTexture: 0.3)
        
        self.jumpingLegs = actionWithAnimationName("pernasPulando", numberOfImages: 8, timePerTexture: 0.1)
        self.jumpingTorso = actionWithAnimationName("troncoPulando", numberOfImages: 8, timePerTexture: 0.1)
        
        self.walkingTorso = actionWithAnimationName("troncoAndando", numberOfImages: 7, timePerTexture: 0.15)
        self.walkingLegs = actionWithAnimationName("pernasAndando", numberOfImages: 7, timePerTexture: 0.15)
        
        self.runningTorso = actionWithAnimationName("troncoAndando", numberOfImages: 7, timePerTexture: 0.1)
        self.runningLegs = actionWithAnimationName("pernasAndando", numberOfImages: 7, timePerTexture: 0.1)
        
        self.lookingUpTorso = actionWithAnimationName("troncoAtacandoCima", numberOfImages: 1, timePerTexture: 0.2)
        self.attackingUpTorso = actionWithAnimationName("troncoAtacandoCima", numberOfImages: 3, timePerTexture: 0.08)
        self.attackingTorso = actionWithAnimationName("troncoAtacando", numberOfImages: 3, timePerTexture: 0.08)
        
    }
    
}
