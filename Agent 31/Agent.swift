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
    }
    
}
