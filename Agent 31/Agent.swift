//
//  Agent.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Agent: Character {
    
    private let initialLegs: String = "pernasParado1"
    private let initialTorso: String = "troncoParado1"
    
    init(position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0){
        
        debugPrint("Initializing Agent")
        
        super.init(legsImage: initialLegs, torsoImage: initialTorso, position: position, zPosition: 1.0)
        
        setGeneralAttributesForAgent()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForAgent(){
        stoppedAnimationForever()
        self.setAgentPhysics()
    }
    
    private func setAgentPhysics(){
        self.physicsBody?.categoryBitMask = ColliderType.Agent.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.Ground.rawValue
    }
    
    override func initializeAnimations(){
        self.stoppedTorso = actionWithAnimationName("troncoParado", numberOfImages: 4, timePerTexture: 0.15)
        self.stoppedLegs = actionWithAnimationName("pernasParado", numberOfImages: 1, timePerTexture: 0.3)
        
        self.jumpingLegs = actionWithAnimationName("pernasPulando", numberOfImages: 8, timePerTexture: 0.1)
        self.jumpingTorso = actionWithAnimationName("troncoPulando", numberOfImages: 8, timePerTexture: 0.1)
        
        self.walkingTorso = actionWithAnimationName("troncoAndando", numberOfImages: 7, timePerTexture: 0.15)
        self.walkingLegs = actionWithAnimationName("pernasAndando", numberOfImages: 7, timePerTexture: 0.15)
        
        self.runningTorso = actionWithAnimationName("troncoAndando", numberOfImages: 7, timePerTexture: 0.1)
        self.runningLegs = actionWithAnimationName("pernasAndando", numberOfImages: 7, timePerTexture: 0.1)
        
        self.lookingUpTorso = actionWithAnimationName("troncoAtacandoCima", numberOfImages: 1, timePerTexture: 0.08)
        self.attackingUpTorso = actionWithAnimationName("troncoAtacandoCima", numberOfImages: 3, timePerTexture: 0.08)
        self.attackingTorso = actionWithAnimationName("troncoAtacando", numberOfImages: 3, timePerTexture: 0.08)
        
        
    }
    
}
