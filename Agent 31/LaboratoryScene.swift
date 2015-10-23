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

    var positionsOfObjects : [CGPoint] = []

    override func didMoveToView(view: SKView) {
        
        print("laboratory scene entered")
        
        // Put all necessary layers
        self.putBackgroundLayer()
        self.putHudLayer()
        self.putGameLayer()
        
        // Gravity
        self.physicsWorld.gravity = CGVectorMake(0, -9.8)
        
        // Store Positions of objects
        self.objectPositions()
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
    
    // objetcts in the lab
    func objectPositions(){
        
        let deskPosition : CGPoint = (self.laboratoryGameLayer.desk?.positionRequiredDesk())!
        let computerPosition : CGPoint = (self.laboratoryGameLayer.computer?.positionRequiredComputer())!
        let trainingCenterPosition : CGPoint = (self.laboratoryGameLayer.trainingCenter?.positionRequiredTraining())!
        let gunCenterPosition : CGPoint = (self.laboratoryGameLayer.gunDevelopmentCenter?.positionRequiredGun())!
        let televisionPosition : CGPoint = (self.laboratoryGameLayer.television?.positionRequiredTelevision())!
        
        positionsOfObjects.append(deskPosition)
        positionsOfObjects.append(computerPosition)
        positionsOfObjects.append(trainingCenterPosition)
        positionsOfObjects.append(gunCenterPosition)
        positionsOfObjects.append(televisionPosition)
        
        for index in 0...4 {
            print(positionsOfObjects[index])
        }
        
    }
    
    func checkAgentPositionAndObjetcs(){
    
        var check : Bool = false
        
        for index in 0...4{
        
            let objPos : CGPoint = positionsOfObjects[index]
            let agentPos : CGPoint = (self.laboratoryGameLayer.agent31Lab?.position)!
            let objPosPlus : CGPoint = CGPointMake(objPos.x + 30, objPos.y)
            
            if agentPos.x > objPos.x && agentPos.x < objPosPlus.x{
            
                check = true
                break
            }
            
        }
        
        if check{
            print("Oh yes")
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
      
        checkAgentPositionAndObjetcs()
        
        
    }

}
