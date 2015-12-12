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
    var damage: Int!
    var ownerGun: Gun!
    var ownerCharacter: String

    init(ownerGun: Gun, orientation: Int, zPosition: CGFloat){
        self.ownerGun = ownerGun
        self.imageName = "bullet1"
        self.orientation = orientation
        self.ownerCharacter = ownerGun.parent!.name!
        
        super.init(imageName: self.imageName!, position: CGPointZero, zPosition: zPosition)
        
        self.defineDamage()
        self.definePosition()
        self.setBulletAttributes()
    }
    
    init(initialPosition: CGPoint, orientation: Int, zPosition: CGFloat){
        self.imageName = "bullet1"
        self.orientation = orientation
        self.ownerCharacter = "enemy"
        
        super.init(imageName: "bullet1", position: CGPointZero, zPosition: zPosition)
        self.defineDamage()
        self.setBulletAttributes()
        self.position = initialPosition
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func definePosition(){
        let characterPosition = ownerGun!.parent!.position
        if(self.orientation == RIGHT){
            self.position = CGPointMake(characterPosition.x + 25, characterPosition.y + ownerGun!.position.y*2.5)
        }else if(self.orientation == LEFT){
            self.position = CGPointMake(characterPosition.x - 25, characterPosition.y + ownerGun!.position.y*2.5)
        }
    }
    
    private func defineVelocity(){
        // Define velocity according to Agent and Gun
        self.velocity = 1
    }
    
    private func defineDamage(){
        // Define damage according to Agent and Gun
        self.damage = 10
    }
    
    private func defineInitialImage() -> String{
        // Define image according to OWNER GUN
        // For now...
        return "bullet1"
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let texture: SKTexture! = generateTextureWithImage(self.imageName!)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(texture: texture, size: self.size)
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.mass = 0.0
        physicsBody.categoryBitMask = ColliderType.Bullet.rawValue
        
        if(ownerCharacter == "agent"){
            physicsBody.contactTestBitMask = ColliderType.Ground.rawValue | ColliderType.Enemy.rawValue
        }else{
            physicsBody.contactTestBitMask = ColliderType.Ground.rawValue | ColliderType.Agent.rawValue
        }
        
        physicsBody.collisionBitMask = ColliderType.None.rawValue
        
        
        return physicsBody
    }
    
    private func setBulletAttributes(){
        self.setScale(0.5)
        
        debugPrint("BULLET | CATEGORY = \(self.physicsBody?.categoryBitMask) CONTACT = \(self.physicsBody?.contactTestBitMask) COLLISION = \(self.physicsBody?.contactTestBitMask)")
    }
    
    private func defineDirection(orientation: Int)->CGVector{
        if(orientation == RIGHT){
            return CGVectorMake(1000.0, 0.0)
        }else if(orientation == LEFT){
            self.invertSpriteHorizontally(true)
            return CGVectorMake(-1000.0, 0.0)
        }else if(orientation == UP){
            self.zRotation = CGFloat(M_PI/2)
            return CGVectorMake(0, 1000.0)
        }else{
            debugPrint("Error defining Bullet direction")
            return CGVectorMake(0, 0)
        }
    }
    
    
    func fire(){
        let move = SKAction.moveBy(defineDirection(self.orientation), duration: 2.0)
        self.runAction(move, completion: {
            debugPrint("remove bullet")
            self.removeFromParent()
            })
    }
    
    func hittedSomething(){
        // Remove MOVE action
        self.removeAllActions()
        // Count just one CONTACT per bullet
//        self.removeFromParent()
        
        // Wait 0.1 seconds before to disappear
        self.runAction(SKAction.waitForDuration(0.1), completion: {
            self.removeFromParent()
        })
    }
    
    override func didBeginContact(contactedNode: SKNode) {
        
        if contactedNode.isKindOfClass(Character){
            (contactedNode as? Character)?.didBeginContact(self)
        }else{
            self.hittedSomething()
        }
    }
    
    
}
