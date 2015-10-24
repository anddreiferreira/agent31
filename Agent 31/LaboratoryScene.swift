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
    var checkAgentAndObjectPosition : Bool = false

    var possibileObjectNumber : Int = 0

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
                buttonTapped(node)
                self.agentFoToCity()
            }
            else if node.name == "deskPlaceholder" {
            
                self.laboratoryGameLayer!.messageTapObjectButton(0)
                possibileObjectNumber = 0
            }
            else if node.name == "tapHereButton" {
                
                self.laboratoryGameLayer!.removeTapObjectButton()
                self.putObjectLayer()
                
            }
        }
        
    }
    
    private func putObjectLayer(){
    
        if possibileObjectNumber == 0{
    
            self.laboratoryGameLayer.putDeskLayer()
        }
    
        possibileObjectNumber = -1
    }
    
    private func agentFoToCity(){
    
        //print("goToCity")
        
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
        
        let nextScene = CityScene(size: self.scene!.size)
        nextScene.scaleMode = SKSceneScaleMode.AspectFill
        
        self.scene!.view!.presentScene(nextScene, transition: transition)
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
    
        var nodeNumber : Int?
        
        for index in 0...4{

            let objPos : CGPoint = positionsOfObjects[index]
            let agentPos : CGPoint = (self.laboratoryGameLayer.agent31Lab?.position)!
            let objPosPlus : CGPoint = CGPointMake(objPos.x + 30, objPos.y)
            
            // checks if the position of the agent is next to an object
            if agentPos.x > objPos.x && agentPos.x < objPosPlus.x{
            
                // verifies if it is the first time he goes near the object
                if possibileObjectNumber != 0{
                    
                    checkAgentAndObjectPosition = true
                    nodeNumber = index
                    possibileObjectNumber = index
                    
                    break
                }
                
            }
            else{
                possibileObjectNumber = 0
            }
            
        }
        
        if checkAgentAndObjectPosition && possibileObjectNumber != 0{
            
            self.laboratoryGameLayer!.messageTapObjectButton(nodeNumber!)
        }
        else if checkAgentAndObjectPosition && possibileObjectNumber == 0{
//            checkAgentAndObjectPosition = false
            
//            self.laboratoryGameLayer!.removeTapObjectButton()

        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
      
        //checkAgentPositionAndObjetcs()
        
        
    }

}
