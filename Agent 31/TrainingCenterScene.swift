//
//  TrainingCenterScene.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/13/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class TrainingCenterScene: SKScene
{
    var trainingCenterBackground: LaboratoryBackgroundLayer!
    var trainingCenterLayer: TrainingCenterLayer!
    
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Training Center scene")
        putBackgroundLayer()
        putTrainingCenterLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let trainScreen = trainingCenterLayer
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            if node.name == "speed" {
                debugPrint("Speed")
                trainScreen.loadAttributeForUpgrade("Speed")
            } else if node.name == "jump" {
                debugPrint("Jump")
                trainScreen.loadAttributeForUpgrade("Jump")
            } else if node.name == "shootingPower" {
                debugPrint("Shooting Power")
                trainScreen.loadAttributeForUpgrade("Shooting Power")
            } else if node.name == "shootingRange" {
                debugPrint("Shooting Range")
                trainScreen.loadAttributeForUpgrade("Shooting Range")
            } else if node.name == "backpack" {
                debugPrint("Backpack")
                trainScreen.loadAttributeForUpgrade("Backpack")
            } else if node.name == "btnBackTrain" {
                // Modificar para remover e não criar outra scene
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = LaboratoryScene(size: self.scene!.size)
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view!.presentScene(nextScene, transition: transition)
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
}

@available(iOS 9.0, *)
extension TrainingCenterScene {
    private func putBackgroundLayer() {
        trainingCenterBackground = LaboratoryBackgroundLayer()
        trainingCenterBackground.putBackground()
        addChild(trainingCenterBackground)
    }
    private func putTrainingCenterLayer() {
        trainingCenterLayer = TrainingCenterLayer()
        trainingCenterLayer.putTrainingCenterLayer()
        addChild(trainingCenterLayer)
    }
}