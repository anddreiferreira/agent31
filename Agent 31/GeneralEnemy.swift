//
//  Enemy.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GeneralEnemy: Character {
    
    private let initialLegs: String = "agentStoppedLegs1"
    private let initialTorso: String = "agentStoppedTorso2"
    
    var distanceToAgent: CGFloat?
    var agentPos: CGPoint?
    var hasBullet: Bool = false
    var hasBulletFrequency: Double = 1.0
    var enemyLevel: Int = 1
    

    init(position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0, enemyLevel: Int = 1){
        
        debugPrint("Initializing Enemy")
        
        super.init(legsImage: initialLegs, torsoImage: initialTorso, position: position, zPosition: 1.0)
 
        // Frequencia que o inimigo vai atirar de acordo com o nível do inimigo
        hasBulletFrequency = 1 / Double(self.enemyLevel)
        NSTimer.scheduledTimerWithTimeInterval(hasBulletFrequency, target: self, selector: "setHasBulletTrue", userInfo: nil, repeats: true)
        
        colorizeEnemy(SKColor.redColor())
        self.name = "enemy"
        self.enemyLevel = enemyLevel
        self.HP = 30
        
        setGeneralAttributesForGeneralEnemy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setHasBulletTrue() {
        self.hasBullet = true
    }
    
    private func setGeneralAttributesForGeneralEnemy(){
        stoppedAnimationForever()
        setGeneralEnemyPhysics()
    }
    
    private func setGeneralEnemyPhysics(){
        self.physicsBody?.categoryBitMask = ColliderType.Enemy.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.Enemy.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.None.rawValue
    }
    
    private func colorizeEnemy(color: SKColor){
        self.color = color
        self.torso?.color = color
        
        self.colorBlendFactor = 0.5
        self.torso?.colorBlendFactor = 0.5
    }
    
    override func initializeAnimations(){
        self.stoppedTorso = actionWithAnimationName("agentStoppedTorso", numberOfImages: 6, timePerTexture: 0.15)
        self.stoppedLegs = actionWithAnimationName("agentStoppedLegs", numberOfImages: 6, timePerTexture: 0.3)
        
        self.jumpingLegs = actionWithAnimationName("agentJumpingLegs", numberOfImages: 6, timePerTexture: 0.1)
        self.jumpingTorso = actionWithAnimationName("agentJumpingTorso", numberOfImages: 6, timePerTexture: 0.1)
        
        self.walkingTorso = actionWithAnimationName("agentWalkingTorso", numberOfImages: 6, timePerTexture: 0.15)
        self.walkingLegs = actionWithAnimationName("agentWalkingLegs", numberOfImages: 6, timePerTexture: 0.15)
        
        self.runningTorso = actionWithAnimationName("agentWalkingTorso", numberOfImages: 6, timePerTexture: 0.1)
        self.runningLegs = actionWithAnimationName("agentWalkingLegs", numberOfImages: 6, timePerTexture: 0.1)
        
        self.lookingUpTorso = actionWithAnimationName("troncoAtacandoCima", numberOfImages: 1, timePerTexture: 0.2)
        self.attackingUpTorso = actionWithAnimationName("troncoAtacandoCima", numberOfImages: 3, timePerTexture: 0.08)
        self.attackingTorso = actionWithAnimationName("agentShootingTorso", numberOfImages: 3, timePerTexture: 0.08)
        
        self.gotHitTorso = actionWithAnimationName("agentGotHitTorso", numberOfImages: 1, timePerTexture: 0.1)
    }
    
    override func update(currentTime: NSTimeInterval) {
//        let intTime = Int(currentTime)
        
        enemyBehaviourGuarding()

        let enemyDetectDistance : CGFloat = 250
        if(self.distanceToAgent < enemyDetectDistance) {
            enemyBehaviourAttack()
        }
    }

    func turnInAgentDirection() {

        let isAgentOver = abs( self.agentPos!.x - self.position.x ) < 10 && self.agentPos?.y > self.position.y
        
        isAgentOver ? (self.lookingUp = true) : (self.lookingUp = false)
        
        let isAgentInRight = self.agentPos?.x > self.position.x && self.orientation == TURNED_LEFT
        let isAgentInLeft = self.agentPos?.x < self.position.x && self.orientation == TURNED_RIGHT
        
        if( isAgentInRight || isAgentInLeft ) {
            self.invertSpriteHorizontally(true)
        }
    }
    
    func enemyBehaviourAttack() {
        
        turnInAgentDirection()
        
        if hasBullet == true {
            shoot()
            self.hasBullet = false
        }
        
        if( self.distanceToAgent > 100 ) {
            self.run(self.enemyLevel)
        }
    }
    
    func enemyBehaviourGuarding() {
        
    }
    
    func setDistanceToAgent(agentPosition: CGPoint) {
        
        self.agentPos = agentPosition
        self.distanceToAgent = distanceBetweenPoints( self.position, second: agentPosition )
    }
    
    func dropResource(){
        let decision = random() % 90 + 1
        debugPrint("decision ==== \(decision)")
        
        if(decision <= 40){
            // Do nothing
        }else if(decision > 50 && decision <= 70){
            self.parent?.addChild(Metal(position: self.position))
        }else{
            self.parent?.addChild(Coin(position: self.position))
        }

    }
    
    override func die() {
        super.die()
        self.dropResource()
    }
}
