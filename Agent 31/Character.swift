//
//  Character.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//


import SpriteKit

class Character: GameObject {
    
    var jumpsRemaining: Int = 2
    var gun: Gun?
    var torso: SKSpriteNode!
    var orientation: Int?
    var lookingUp: Bool = false
    var attacking: Bool = false
    var running: Bool = false
    var jumps = 2
    
    var HP: Int = 100
    var velocity: CGFloat = 0.0
    
    // Animations...
    
    //...all animations
    var walkingTorso: SKAction?
    var walkingLegs: SKAction?
    var runningTorso: SKAction?
    var runningLegs: SKAction?
    var attackingTorso: SKAction?
    var lookingUpTorso: SKAction?
    var attackingUpTorso: SKAction?
    var stoppedTorso: SKAction?
    var stoppedLegs: SKAction?
    var jumpingLegs: SKAction?
    var jumpingTorso: SKAction?
    var gotHitTorso: SKAction?
    
    init(legsImage: String = "agentStoppedLegs1", torsoImage: String = "agentStoppedTorso2", position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = zPositionsCity.ENEMY.rawValue, withGun: Bool = true, gunName: String = "CA115"){
        
        super.init(imageName: legsImage, position: position, zPosition: zPosition)
        
        self.name = "character"
        
        initializeTorso(torsoImage)
        
        if(withGun == true){
            initializeGun(gunName)
        }
        
        setGeneralAttributesForCharacter()
    }
    
    
    private func initializeTorso(image: String){
        let torsoTexture: SKTexture = generateTextureWithImage(image)
        self.torso = SKSpriteNode(texture: torsoTexture)
        self.torso?.zPosition = 1
        self.torso?.position = CGPointMake(0.0, -6.3)
        
        self.addChild(torso!)
    }
    
    private func initializeGun(gunName: String){
        self.gun = Gun(gunName: gunName, damageBase: 1, rangeBase: 1, owner: self.name!)
        self.gun!.zPosition = 2
        self.gun!.position = CGPointMake(0.0, -7.8)
        self.addChild(self.gun!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForCharacter(){
        
        // Provisory Scale
        self.setScale(2.0)
        
        // Initialize orientation as right
        self.orientation = RIGHT
        
        initializeCharacterPhysicsBody()
        initializeAnimations()
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let rectangleSize = CGSizeMake(self.size.width*0.4, self.size.height*0.6)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(rectangleOfSize: rectangleSize, center: CGPointMake(-2, -8))
        physicsBody.affectedByGravity = true
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0

        return physicsBody
    }
    
    private func initializeCharacterPhysicsBody(){
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.mass = 50.0
        self.physicsBody?.restitution = 0.0
    }
    
    func changeVelocity(xvelocity: CGFloat){
        let futureVelocity = self.velocity + xvelocity/2.0
        
        if(futureVelocity < MAX_CHARACTER_VELOCITY && futureVelocity > MIN_CHARACTER_VELOCITY){
            self.velocity += xvelocity
        }else if(futureVelocity > MAX_CHARACTER_VELOCITY){
            self.velocity = MAX_CHARACTER_VELOCITY
        }else if(futureVelocity < MIN_CHARACTER_VELOCITY){
            self.velocity = MIN_CHARACTER_VELOCITY
        }
        
    }
    
    override func didBeginContact(contactedNode: SKNode) {
        
        if(contactedNode.isKindOfClass(Bullet)){
            let projectile = (contactedNode as? Bullet)!
            
            // If projectile isn't throwed by character with same name...
            if(projectile.ownerCharacter != self.name){
                self.gotHit(projectile.damage)
                projectile.hittedSomething()
            }
        }else if(contactedNode.isKindOfClass(Ground) && isAbove(self.position, point2: contactedNode.position)){
            jumpsRemaining = 2
        }
        
    }

}

// MARK: Actions
extension Character{
    func invertAccordingToVelocity(){
        if(self.velocity > 0.0 && self.orientation != RIGHT){
            
            invertSpriteHorizontally(true)
            self.orientation = RIGHT
            
        }else if(self.velocity < 0.0 && self.orientation != LEFT){
            
            invertSpriteHorizontally(true)
            self.orientation = LEFT
            
        }else{
            invertSpriteHorizontally(false)
        }
    }
    
    func lookUp(yvelocity: CGFloat){
        if(yvelocity >= 48){
            lookUpAnimationOnce()
            self.velocity /= 2
            self.lookingUp = true
        }else{
            self.lookingUp = false
        }
    }
    
    func gotHit(damage: Int){
        debugPrint("Character HP \(self.HP) -> \(self.HP - damage)")
        self.gotHitAnimationOnce()
        self.HP = self.HP - damage
        
        if(self.HP <= 0){
            self.die()
        }
    }
    
    func run(){
        invertAccordingToVelocity()
        
        self.walkingAnimationOnce()
        
        //WARNING: verificar isso depois
        self.position = CGPointMake(self.position.x + (self.velocity * 0.3), self.position.y)
        //        self.runAction(SKAction.moveTo(CGPointMake(self.position.x + self.velocity*0.3, self.position.y), duration: 0.1))
    }
    
    func jump(){
        if(jumpsRemaining > 0){
            jumpAnimationOnce()
            if(jumpsRemaining == 2){
                self.physicsBody?.applyImpulse(vectorFirstJump())
            }else{
                self.physicsBody?.applyImpulse(vectorSecondJump())
            }
            
            jumpsRemaining--
        }
    }
    
    func vectorFirstJump() -> CGVector{
        return CGVectorMake(0, 25*1000)
    }
    
    func vectorSecondJump() ->CGVector{
        return CGVectorMake(0, 15*1000)
    }
    
    func shoot(){
        if(self.gun != nil){
            self.attacking = true
            if(lookingUp == false){
                self.attackingAnimationOnce()
                
                let bullet = Bullet(ownerGun: self.gun!, orientation: self.orientation!)
                self.parent?.addChild(bullet)
                
                bullet.fire()
                
            }else if(lookingUp == true){
                
                self.attackingUpAnimationOnce()
                let initialPosition = CGPointMake(self.position.x, self.position.y + (self.size.height/2)*1.08)
                let bullet = Bullet(initialPosition: initialPosition, orientation: UP)
                self.parent?.addChild(bullet)
                
                bullet.fire()
            }
        }
        
    }
    
    func die(){
        // Call dying animation here
        // Change the duration
        self.runAction(SKAction.waitForDuration(0.1), completion: {
            self.removeFromParent()
        })
    }
}

// MARK: Animations
extension Character{
    
    func initializeAnimations(){
        
        self.stoppedTorso = nil
        self.stoppedLegs = nil
        
        self.walkingTorso = nil
        self.walkingLegs = nil
        
        self.runningTorso = nil
        self.runningLegs = nil
        
        self.lookingUpTorso = nil
        self.attackingUpTorso = nil
        self.attackingTorso = nil
        
        self.jumpingLegs = nil
        self.jumpingTorso = nil
        
        self.gotHitTorso = nil
        
    }
    
    func stoppedAnimationForever(){
        if(self.stoppedTorso != nil && self.stoppedLegs != nil){
            self.torso?.runAction(SKAction.repeatActionForever(self.stoppedTorso!), withKey: "stopped")
            self.runAction(SKAction.repeatActionForever(self.stoppedLegs!), withKey: "stopped")
        }
    }
    
    private func jumpAnimationOnce(){
        if(self.jumpingTorso != nil && self.jumpingLegs != nil && self.lookingUp == false){
            self.runAction(self.jumpingLegs!)
            self.torso?.runAction(self.jumpingTorso!)
            self.gun?.jumpAnimation()
        }
    }
    
    private func walkingAnimationOnce(){
        if(self.walkingLegs != nil && self.walkingTorso != nil && self.running == false){
            self.running = true
            self.gun?.walkingAnimation()
            self.torso?.runAction(self.walkingTorso!)
            self.runAction(self.walkingLegs!, completion: {
                self.running = false
            })
        }
    }
    
    func attackingAnimationOnce(){
        if(self.attackingTorso != nil){
            self.torso?.runAction(self.attackingTorso!, completion: {
                self.attacking = false
            })
            self.gun?.shootAnimation()
        }
    }
    
    private func attackingUpAnimationOnce(){
        if(self.attackingUpTorso != nil){
            self.torso?.runAction(self.attackingUpTorso!, completion:  {
                self.attacking = false
            })
            self.gun?.shootUpAnimation()
        }
    }
    
    func lookUpAnimationOnce(){
        if(self.lookingUpTorso != nil && self.attacking == false){
            self.torso?.runAction(self.lookingUpTorso!)
            self.gun?.lookUpAnimation()
        }
    }
    
    func gotHitAnimationOnce(){
        if(self.gotHitTorso != nil){
            self.torso?.runAction(self.gotHitTorso!)
            self.gun?.gotHitAnimation()
        }
    }
    
    override func invertSpriteHorizontally(option: Bool) {
        super.invertSpriteHorizontally(option)
        
        if option == true {
            self.orientation = self.orientation! * -1
        }
    }

    
    
    // Sobrescrever para o inimigo que possui velocidade nula
    func run( enemyLevel: Int ) {
        self.velocity = CGFloat(enemyLevel)*7.0 * CGFloat(self.orientation!)
        
        invertAccordingToVelocity()
        
        self.walkingAnimationOnce()
        
        self.position = CGPointMake(self.position.x + (self.velocity * 0.12), self.position.y)
    }

}
