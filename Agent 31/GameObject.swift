//
//  GameObject.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GameObject: SKSpriteNode {
    
    var initialImageName: String?

    init(imageName: String = "1", position: CGPoint = middleOfTheScreenPoint, scale: CGFloat = 1.0, zPosition: CGFloat = 1.0){
        
        debugPrint("Initializing GameObject")
        
        let texture: SKTexture! = generateTextureWithImage(imageName)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.position = position
        self.zPosition = zPosition
        self.setScale(scale)
        self.name = imageName
        self.initialImageName = imageName
        
        setBasicAttributes()

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func invertSpriteHorizontally(option: Bool) -> Void{
        if(option == true){
            self.xScale = -self.xScale
        }else{
            
        }
    }
    
    func generatePhysicsBody() -> SKPhysicsBody{
        let texture: SKTexture! = generateTextureWithImage(self.initialImageName!)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(texture: texture, size: self.size)
        physicsBody.affectedByGravity = false
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        return physicsBody
    }

    private func setBasicAttributes(){
        debugPrint("Set Basic Attributes for GameObject")
        self.physicsBody = generatePhysicsBody()
    }
    
    func didBeginContact(contactedNode: SKNode) {
        
    }
    
    func update(currentTime: Float){

    }
    
}
