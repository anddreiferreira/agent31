//
//  GameObject.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GameObject: SKSpriteNode {
    

    init(imageName: String = "1", position: CGPoint = middleOfTheScreenPoint, scale: CGFloat = 0.5, zPosition: CGFloat = 1.0){
        
        debugPrint("Initializing GameObject")
        
        let texture: SKTexture! = generateTextureWithImage(imageName)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.position = position
        self.zPosition = zPosition
        
        // Method that will be overwrited in Subclasses!
        setBasicAttributes()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func invertSpriteHorizontally(option: Bool) -> Void{
        if(option == true){
            self.xScale = -fabs(self.xScale)
        }else{
            self.xScale = fabs(self.xScale)
        }
    }
    
    func generatePhysicsBody(imageName: String) -> SKPhysicsBody{
        let texture: SKTexture! = generateTextureWithImage(imageName)
        let physicsBody: SKPhysicsBody = SKPhysicsBody(texture: texture, size: self.size)
        physicsBody.affectedByGravity = false
        
        return physicsBody
    }

    func setBasicAttributes() -> Void{
        debugPrint("Setting basics attributes in Game Object")
        self.physicsBody = self.generatePhysicsBody("1")
    }
    
}
