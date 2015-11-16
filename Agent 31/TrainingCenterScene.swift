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
    private var trainingCenterBackgroundLayer: LaboratoryBackgroundLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Training Center scene")
        putBackgroundLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Training Center scene")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Training Center scene")
    }
}

@available(iOS 9.0, *)
extension TrainingCenterScene {
    private func putBackgroundLayer() {
        trainingCenterBackgroundLayer = LaboratoryBackgroundLayer()
        trainingCenterBackgroundLayer.putBackground()
        addChild(trainingCenterBackgroundLayer)
    }
}