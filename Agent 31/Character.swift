//
//  Character.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//


import SpriteKit

class Character: GameObject {
    
    // Defines
    let TURNED_RIGHT = true
    let TURNED_LEFT = false
    
    var torso: SKSpriteNode?
    var orientation: Bool?
    
    var velocity: CGFloat?
    
    // Animations...
    
    //...all animations
    var walkingTorso: SKAction?
    var walkingLegs: SKAction?
    var runningTorso: SKAction?
    var runningLegs: SKAction?
    var attackingUpTorso: SKAction?
    var attackingTorso: SKAction?
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
        self.setScale(4.0)
        
        // Initialize velocity as zero (stopped)
        self.velocity = 0.0
        // Initialize orientation as right
        self.orientation = TURNED_RIGHT
        
        initializeCharacterPhysicsBody()
        initializeAnimations()
    }
    
    private func initializeTorso(image: String){
        let torsoTexture: SKTexture = generateTextureWithImage(image)
        self.torso = SKSpriteNode(texture: torsoTexture)
        self.torso?.zPosition = 1
        self.addChild(torso!)
    }
    
    private func initializeCharacterPhysicsBody(){
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.mass = 1.0
        self.physicsBody?.restitution = 0.0
    }
    
    func initializeAnimations(){
        
        self.stoppedTorso = nil
        self.stoppedLegs = nil
        
        self.walkingTorso = nil
        self.walkingLegs = nil
        
        self.runningTorso = nil
        self.runningLegs = nil
        
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
        self.physicsBody?.applyImpulse(CGVectorMake(0, 400))
    }
    
    func stoppedAnimationForever(){
        self.torso?.runAction(SKAction.repeatActionForever(self.stoppedTorso!), withKey: "stopped")
        self.runAction(SKAction.repeatActionForever(self.stoppedLegs!), withKey: "stopped")
    }
    
    func jumpAnimationOnce(){
        if(self.jumpingTorso != nil && self.jumpingLegs != nil){
            self.runAction(self.jumpingLegs!)
            self.torso?.runAction(self.jumpingTorso!)
        }
    }
    
    func walkingAnimationOnce(){
        if(self.walkingLegs != nil && self.walkingTorso != nil){
            self.torso?.runAction(self.walkingTorso!)
            self.runAction(self.walkingLegs!)
        }
    }
   
    func move(xvelocity: CGFloat){
        self.velocity = xvelocity
        
        invertAccordingToVelocity()
        
        run()
    }
    
    func run(){
        self.position = CGPointMake(self.position.x + (self.velocity! * 0.12), self.position.y)
    }
    
    func invertAccordingToVelocity(){
        if((self.velocity! > 0.0 && self.orientation != TURNED_RIGHT) || (self.velocity < 0.0 && self.orientation != TURNED_LEFT)){
            
            invertSpriteHorizontally(true)
            
        }else{
            
            invertSpriteHorizontally(false)
        }
    }
}
