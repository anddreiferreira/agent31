//
//  Gun.swift
//  Agent 31
//
//  Created by Julio Xavier on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Gun : SKSpriteNode {
    
    var level: Int?
    var gunName: String?
    var owner: String?
    var damageBase: Int?
    var rangeBase: Int?
    var cost: Int?
    
    init(gunName: String, level: Int = 1, owner: String = "Enemy", damageBase: Int, rangeBase: Int, zPosition: CGFloat = 1.0, scale: CGFloat = 1.0){
        debugPrint("Initializing Gun")
        
        self.level = level
        self.gunName = gunName
        self.owner = owner
        self.damageBase = damageBase
        self.rangeBase = rangeBase
        
        let texture: SKTexture! = generateTextureWithImage(gunName)
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
        
    }
}