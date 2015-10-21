//
//  LaboratoryScene.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryScene: SKScene {

//    var hudLayerLab : LaboratoryHudLayer
    var laboratoryBackgroundLayer : LaboratoryBackgroundLayer
    
    override func didMoveToView(view: SKView) {
        
        print("laboratory scene entered")

//        self.loadLayers()
        
    }
    

    override init(size: CGSize) {
        
//        laboratoryBackgroundLayer
        
        self.laboratoryBackgroundLayer = LaboratoryBackgroundLayer()
        
        super.init()

        self.addChild(laboratoryBackgroundLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
    }

}



// caso precise


/* Called when a touch begins */

//        for touch in (touches ) {
//            let location = touch.locationInNode(self)
//
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//
//
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//
//            sprite.runAction(SKAction.repeatActionForever(action))
//
//            self.addChild(sprite)
//        }


/* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//
//        let character = GameObject(position: CGPointMake(667/2, 375/2));
//        self.addChild(character)
//
//        let label = createLabelNode("PALHAÇO", name: "label")
//        self.addChild(label)
//
//        self.addChild(myLabel)
