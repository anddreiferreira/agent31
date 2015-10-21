//
//  LaboratoryScene.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryScene: SKScene {

    private var laboratoryBackgroundLayer : LaboratoryBackgroundLayer!
    private var laboratoryHudLayer : LaboratoryHudLayer!
    private var laboratoryGameLayer : LaboratoryGameLayer!
    
    
    override func didMoveToView(view: SKView) {
        
        print("laboratory scene entered")
        
        self.putBackgroundLayer()
        self.putHudLayer()
        self.putGameLayer()
        

    }
    

    func putBackgroundLayer(){
        
        self.laboratoryBackgroundLayer = LaboratoryBackgroundLayer()
        self.laboratoryBackgroundLayer.putBackground()
        self.addChild(laboratoryBackgroundLayer)
    
    }

    func putHudLayer(){
        
        self.laboratoryHudLayer = LaboratoryHudLayer()
        self.laboratoryHudLayer.putHudLayer()
        self.addChild(laboratoryHudLayer)
        
    }
    
    func putGameLayer(){
        
        self.laboratoryGameLayer = LaboratoryGameLayer()
        self.laboratoryGameLayer.putGameLayer()
        self.addChild(laboratoryGameLayer)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        if let touch = touches.first {
            
            let node = nodeAtPoint(touch.locationInNode(self))
            
            switch node {
                
            case "jumpButtonLab":
                print("ok")
            default:
                print("ok")
                
                //                   appleNode?.position = touch.locationInNode(self)
            }
            
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            let location = (touch as UITouch).locationInNode(self)
            
            let node = self.nodeAtPoint(location)
            
            if node.name == "jumpButtonLab" {
                print("Agent jump")
            }
        
        }
        
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
