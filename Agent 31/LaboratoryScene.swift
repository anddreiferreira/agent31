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
