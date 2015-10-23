//
//  LaboratoryScene.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

//let kAnalogStickdiameter: CGFloat = 110

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
        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8)
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
        
        debugPrint("Touches began on Laboratory")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if node.name == "jumpButtonLab" {
                //print("Agent jump")
                buttonTapped(node)
                self.laboratoryGameLayer.agent31Lab?.jump()
            }
            else if node.name == "goToCity" {
                //print("goToCity")
                buttonTapped(node)

                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                
                let nextScene = CityScene(size: self.scene!.size)
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                
                self.scene!.view!.presentScene(nextScene, transition: transition)
            }
        
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        // check positions
    }

}
