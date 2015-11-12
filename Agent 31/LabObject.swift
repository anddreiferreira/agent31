//
//  LabObject.swift
//  Agent 31
//
//  Created by Julio Xavier on 12/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LabObject: SKSpriteNode {

    init(imageNamed: String, groundPosition: CGPoint, scale: CGFloat = 1.0, zPosition: CGFloat = 0) {
        debugPrint("Initializing Lab Object using image named \(imageNamed)");
        
        let texture: SKTexture! = generateTextureWithImage(imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.position = groundPosition
        self.zPosition = zPosition
        self.setScale(scale)
        self.name = imageNamed;
        
        setBasicAttributes()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBasicAttributes(){
        
    }
    
    func updateLabObject(time: CGFloat){
        
    }
}
