//
//  LabObject.swift
//  Agent 31
//
//  Created by Julio Xavier on 12/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LabObject: SKSpriteNode {
    
    var showingBalloon: Bool = false
    var balloon: SKSpriteNode?

    init(imageNamed: String, groundPosition: CGPoint, zPosition: CGFloat = 0) {
        debugPrint("Initializing Lab Object using image named \(imageNamed)");
        
        let texture: SKTexture! = generateTextureWithImage(imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        setBalloon()
        self.position = groundPosition
        self.zPosition = zPosition
        self.setScale(0.5)
        self.name = imageNamed;
        self.anchorPoint = CGPointMake(0.5, 1.1)
        
        setBasicAttributes()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBasicAttributes(){
        
    }
    
    func updateLabObject(time: CGFloat){
        
    }
    
    func setBalloon(){
        balloon = createSpriteNode("tapHereButton", name: "balloon");
        balloon!.position = CGPointMake(self.size.width/2, self.size.height)
        balloon!.setScale(2.0)
    }
    
    func putBalloon(){
        if(self.showingBalloon == false){
            self.showingBalloon = true
            self.addChild(balloon!)
        }
    }
    
    func removeBalloon(){
        if((self.childNodeWithName("balloon")) != nil && self.showingBalloon == true){
            self.childNodeWithName("balloon")?.removeFromParent()
            self.showingBalloon = false
        }
    }
}
