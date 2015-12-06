//
//  Agent.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Agent: Character {
    
    init(position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0, withGun: Bool = true, gunName: String = "CA115"){
        
        debugPrint("Initializing Agent")
        
        super.init(position: position, zPosition: 1.0, withGun: withGun, gunName: gunName)
        
        self.name = "agent"
        
        setGeneralAttributesForAgent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForAgent(){
        stoppedAnimationForever()
        self.setAgentPhysics()
        
        
        self.HP = 200
        
    }
    
    
    private func setAgentPhysics(){
        self.physicsBody?.categoryBitMask = ColliderType.Agent.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.Coin.rawValue | ColliderType.Metal.rawValue | ColliderType.Ground.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.Ground.rawValue | ColliderType.Enemy.rawValue
        
    }
    
    override func initializeAnimations(){
        self.stoppedTorso = actionWithAnimationName("agentStoppedTorso", numberOfImages: 6, timePerTexture: 0.15)
        self.stoppedLegs = actionWithAnimationName("agentStoppedLegs", numberOfImages: 6, timePerTexture: 0.15)
        
        self.jumpingLegs = actionWithAnimationName("agentJumpingLegs", numberOfImages: 6, timePerTexture: 0.1)
        self.jumpingTorso = actionWithAnimationName("agentJumpingTorso", numberOfImages: 6, timePerTexture: 0.1)
        
        self.walkingTorso = actionWithAnimationName("agentWalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.walkingLegs = actionWithAnimationName("agentWalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.runningTorso = actionWithAnimationName("agentWalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.runningLegs = actionWithAnimationName("agentWalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.lookingUpTorso = actionWithAnimationName("agentShootingUpTorso", numberOfImages: 1, timePerTexture: 0.3)
        self.attackingUpTorso = actionWithAnimationName("agentShootingUpTorso", numberOfImages: 3, timePerTexture: 0.08)
        self.attackingTorso = actionWithAnimationName("agentShootingTorso", numberOfImages: 3, timePerTexture: 0.08)
        
        self.gotHitTorso = actionWithAnimationName("agentGotHitTorso", numberOfImages: 4, timePerTexture: 0.1)
        
    }
    
    override func update(currentTime: NSTimeInterval) {

    }
    
    override func didBeginContact(contactedNode: SKNode) {
        super.didBeginContact(contactedNode)
        
        
        if contactedNode.isKindOfClass(Coin){
            contactedNode.removeFromParent()
            ResourcesData.sharedInstance.gold += ((contactedNode as? Coin)?.value)!
        }else if contactedNode.isKindOfClass(Metal){
            contactedNode.removeFromParent()
            ResourcesData.sharedInstance.metal += ((contactedNode as? Metal)?.value)!
        }
    }
    
    override func die() {
        super.die()
        
        CharacterData.sharedInstance.decreaseLife()
    }
    
}