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
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            if node.name == "speed" {
                debugPrint("Speed")
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = UpgradeScene(size: self.scene!.size)
                nextScene.upgradeName = "Speed"
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(nextScene, transition:  transition)
                self.removeFromParent()
            } else if node.name == "jump" {
                debugPrint("Jump")
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = UpgradeScene(size: self.scene!.size)
                nextScene.upgradeName = "Jump"
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(nextScene, transition:  transition)
                self.removeFromParent()
            } else if node.name == "shootingPower" {
                debugPrint("Shooting Power")
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = UpgradeScene(size: self.scene!.size)
                nextScene.upgradeName = "Shooting Power"
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(nextScene, transition:  transition)
                self.removeFromParent()
            } else if node.name == "shootingRange" {
                debugPrint("Shooting Range")
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = UpgradeScene(size: self.scene!.size)
                nextScene.upgradeName = "Shooting Range"
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(nextScene, transition:  transition)
                self.removeFromParent()
            } else if node.name == "backpack" {
                debugPrint("Backpack")
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = UpgradeScene(size: self.scene!.size)
                nextScene.upgradeName = "Backpack"
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(nextScene, transition:  transition)
                self.removeFromParent()
            } else if node.name == "btnBackTrain" {
                let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
                let nextScene = LaboratoryScene(size: self.scene!.size)
                nextScene.scaleMode = SKSceneScaleMode.AspectFill
                self.view?.presentScene(nextScene, transition:  transition)
                self.removeFromParent()
            }
        }
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