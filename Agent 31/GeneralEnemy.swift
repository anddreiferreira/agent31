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
    
    var distanceToAgent: CGFloat?
    var agentPos: CGPoint?
    var hasBullet: Bool = false
    var hasBulletFrequency: Double = 1.0
    var enemyLevel: Int = 1
    
//    override init(legsImage: String, torsoImage: String, position: CGPoint, zPosition: CGFloat) {
//        super.init(legsImage: legsImage, torsoImage: torsoImage, position: position, zPosition: zPosition)
//        
//        // While using test sprites
//        self.color = SKColor.redColor()
//        
//        setGeneralAttributesForGeneralEnemy()
//    }
    
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
        self.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue | ColliderType.Ground.rawValue | ColliderType.Bullet.rawValue
        self.physicsBody?.contactTestBitMask = (self.physicsBody?.collisionBitMask)!
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
        
        self.gotHitLegs = actionWithAnimationName("pernasGetHit", numberOfImages: 1, timePerTexture: 0.1)
        self.gotHitTorso = actionWithAnimationName("troncoGetHit", numberOfImages: 1, timePerTexture: 0.1)
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
        let decision = random() % 100 + 1
        
        if(decision <= 50){
            // Do nothing
        }else if(decision > 50 && decision <= 75){
            self.addChild(Coin(position: self.position))
        }else{
            self.addChild(Metal(position: self.position))
        }
        self.parent?.addChild(Metal(position: self.position))
    }
    
    override func die() {
        super.die()
        self.dropResource()
    }
}
