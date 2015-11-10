//
//  Bullet.swift
//  Agent 31
//
//  Created by Julio Xavier on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Bullet : GameObject {
    
    var orientation: Int
    var imageName: String?
    var velocity: Int?
    var damage: Int?
    var ownerGun: Gun?

    init(ownerGun: Gun, orientation: Int, zPosition: CGFloat){
        self.ownerGun = ownerGun
        self.imageName = "bullet1"
        self.orientation = orientation
        
        super.init(imageName: self.imageName!, position: CGPointZero, zPosition: zPosition)
        self.position = ownerGun.position
    }
    
    init(initialPosition: CGPoint, orientation: Int, zPosition: CGFloat){
        self.imageName = "bullet1"
        self.orientation = orientation
        
        super.init(imageName: "bullet1", position: CGPointZero, zPosition: zPosition)
        self.position = initialPosition
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func defineVelocity(){
        // Define velocity according to Agent and Gun
        self.velocity = 1
    }
    
    private func defineDamage(){
        // Define damage according to Agent and Gun
        self.damage = 1
    }
    
    private func defineInitialImage() -> String{
        // Define image according to OWNER GUN
        // For now...
        return "bullet1"
    }
    
    private func setBulletAttributes(){
        self.setScale(0.5)
        self.physicsBody = self.getPhysicsBody()
    }
    
    private func defineDirection(orientation: Int)->CGVector{
        if(orientation == TURNED_RIGHT){
            return CGVectorMake(1000.0, 0.0)
        }else if(orientation == TURNED_LEFT){
            self.invertSpriteHorizontally(true)
            return CGVectorMake(-1000.0, 0.0)
        }else if(orientation == TURNED_UP){
            self.zRotation = CGFloat(M_PI/2)
            return CGVectorMake(0, 1000.0)
        }else{
            debugPrint("Error defining Bullet direction")
            return CGVectorMake(0, 0)
        }
    }
    
    private func getPhysicsBody() -> SKPhysicsBody{
        let texture: SKTexture! = generateTextureWithImage(self.imageName!)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(texture: texture, size: self.size)
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.mass = 1.0
        physicsBody.categoryBitMask = ColliderType.Bullet.rawValue
        physicsBody.collisionBitMask = ColliderType.Agent.rawValue | ColliderType.Ground.rawValue | ColliderType.Enemy.rawValue
        
        
        
        return physicsBody
    }
    
    func fire(){
        let move = SKAction.moveBy(defineDirection(self.orientation), duration: 2.0)
        self.runAction(move, completion: {
            debugPrint("remove bullet")
            self.removeFromParent()
            })
    }
    
    
}
