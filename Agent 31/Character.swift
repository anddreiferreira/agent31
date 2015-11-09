//
//  Character.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//


import SpriteKit

class Character: GameObject {
    
    var torso: SKSpriteNode?
    var orientation: Int?
    var lookingUp: Bool = false
    var attacking: Bool = false
    var running: Bool = false

    
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
    var getHitTorso: SKAction?
    var getHitLegs: SKAction?
//    
//    
//    //...actual animation
//    var actualTorso: SKAction?
//    var actualLegs: SKAction?
    
    init(legsImage: String, torsoImage: String, position: CGPoint = middleOfTheScreenPoint, zPosition: CGFloat = 1.0){
        
        super.init(imageName: legsImage, position: position, zPosition: zPosition)
        
        self.zPosition = 1
        initializeTorso(torsoImage)
        
        setGeneralAttributesForCharacter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForCharacter(){
        
        // Provisory Scale
        self.setScale(3.0)
        
        // Initialize orientation as right
        self.orientation = TURNED_RIGHT
        
        initializeCharacterPhysicsBody()
        initializeAnimations()
    }
    
    private func initializeTorso(image: String){
        let torsoTexture: SKTexture = generateTextureWithImage(image)
        self.torso = SKSpriteNode(texture: torsoTexture)
        self.torso?.zPosition = 1
        debugPrint("POSITION ===== \(self.torso?.position)")
        self.addChild(torso!)
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let rectangleSize = CGSizeMake(self.size.width*0.35, self.size.height*0.7)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(rectangleOfSize: rectangleSize, center: CGPointMake(0, -4))
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
        
        self.getHitTorso = nil
        self.getHitLegs = nil
        
//        self.actualTorso = nil
//        self.actualLegs = nil
        
    }
    
    func jump(){
        jumpAnimationOnce()
        self.physicsBody?.applyImpulse(CGVectorMake(0, 20*1000))
    }
    
    
    func stoppedAnimationForever(){
        self.torso?.runAction(SKAction.repeatActionForever(self.stoppedTorso!), withKey: "stopped")
        self.runAction(SKAction.repeatActionForever(self.stoppedLegs!), withKey: "stopped")
    }
    
    func jumpAnimationOnce(){
        if(self.jumpingTorso != nil && self.jumpingLegs != nil && self.lookingUp == false){
            self.runAction(self.jumpingLegs!)
            self.torso?.runAction(self.jumpingTorso!)
        }
    }

    func walkingAnimationOnce(){
        if(self.walkingLegs != nil && self.walkingTorso != nil && self.running == false){
            self.running = true
            
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
        }
    }
    
    func attackingUpAnimationOnce(){
        if(self.attackingUpTorso != nil){
            self.torso?.runAction(self.attackingUpTorso!, completion:  {
                self.attacking = false
            })
        }
    }
    
    func lookUpAnimationOnce(){
        if(self.lookingUpTorso != nil && self.attacking == false){
            self.torso?.runAction(self.lookingUpTorso!)
        }
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
    
    func lookUp(yvelocity: CGFloat){
        if(yvelocity >= 48){
            lookUpAnimationOnce()
            self.velocity /= 2
            self.lookingUp = true
        }else{
            self.lookingUp = false
        }
    }
    
    func run(){
        invertAccordingToVelocity()
        
        self.walkingAnimationOnce()

        self.position = CGPointMake(self.position.x + (self.velocity * 0.12), self.position.y)
    }
    
    func invertAccordingToVelocity(){
        if(self.velocity > 0.0 && self.orientation != TURNED_RIGHT){
            
            invertSpriteHorizontally(true)
            self.orientation = TURNED_RIGHT
            
        }else if(self.velocity < 0.0 && self.orientation != TURNED_LEFT){

            invertSpriteHorizontally(true)
            self.orientation = TURNED_LEFT
            
        }else{
            invertSpriteHorizontally(false)
        }
    }

    func shoot(){
        self.attacking = true
        if(lookingUp == false){
            self.attackingAnimationOnce()
            
            let initialPosition = CGPointMake(self.position.x + self.size.width/2, self.position.y - self.size.height/8)
            let bullet = Bullet(initialPosition: initialPosition, orientation: self.orientation!, zPosition: 3)
            self.parent?.addChild(bullet)
            
            bullet.fire()
            
        }else if(lookingUp == true){
            
            self.attackingUpAnimationOnce()
            let initialPosition = CGPointMake(self.position.x, self.position.y + (self.size.height/2)*1.08)
            let bullet = Bullet(initialPosition: initialPosition, orientation: TURNED_UP, zPosition: 3)
            self.parent?.addChild(bullet)
            
            bullet.fire()
        }
        
    }
}
