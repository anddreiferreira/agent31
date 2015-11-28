//
//  Gun.swift
//  Agent 31
//
//  Created by Julio Xavier on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Gun : SKSpriteNode {
    
    var walking: SKAction?
    var attacking: SKAction?
    var stopped: SKAction?
    var jumping: SKAction?
    var gotHit: SKAction?
    
    var level: Int
    var gunName: String
    var owner: String
    var damageBase: Int
    var rangeBase: Int
    
    init(gunName: String, level: Int = 1, owner: String = "Enemy", damageBase: Int, rangeBase: Int, zPosition: CGFloat = 1.0, scale: CGFloat = 1.0){
        debugPrint("Initializing Gun")
        
        self.level = level
        self.gunName = gunName
        self.owner = owner
        self.damageBase = damageBase
        self.rangeBase = rangeBase
        
        let texture: SKTexture! = generateTextureWithImage("\(gunName)Stopped1")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.zPosition = zPosition
        self.setScale(scale)
        self.name = gunName
        
        setBasicGunAttributes()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBasicGunAttributes(){
        initializeAnimations()
    }

    func initializeAnimations(){
        self.walking = actionWithAnimationName("\(gunName)Walking", numberOfImages: 6, timePerTexture: 0.15)
        self.attacking = actionWithAnimationName("\(gunName)Shooting", numberOfImages: 3, timePerTexture: 0.08)
        self.stopped = actionWithAnimationName("\(gunName)Stopped", numberOfImages: 6, timePerTexture: 0.15)
        self.jumping = actionWithAnimationName("\(gunName)Jumping", numberOfImages: 6, timePerTexture: 0.1)
        self.gotHit = actionWithAnimationName("\(gunName)GotHit", numberOfImages: 4, timePerTexture: 0.1)
        
    }
}