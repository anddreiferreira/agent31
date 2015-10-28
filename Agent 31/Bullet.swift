//
//  Bullet.swift
//  Agent 31
//
//  Created by Julio Xavier on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Bullet : GameObject {
    
    var velocity: Int?
    var damage: Int?
    var ownerGun: Gun

    init(ownerGun: Gun, orientation: Int, zPosition: CGFloat){
        self.ownerGun = ownerGun
        super.init(imageName: "bullet1", position: CGPointZero, zPosition: zPosition)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func defineVelocity(){
        // Define velocity according to Agent and Gun
        self.velocity = 1
    }
    
    func defineDamage(){
        // Define damage according to Agent and Gun
        self.damage = 1
    }
    
    func defineInitialImage() -> String{
        // Define image according to OWNER GUN
        // For now...
        return "bullet1"
    }
}
