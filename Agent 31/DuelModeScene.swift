//
//  DuelModeScene.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/17/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class DuelModeScene: SKScene {
    
    private var duelModeBackground: LaboratoryBackgroundLayer!
    private var duelModeLayer: DuelModeLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Duel Mode scene")
        putBackgroundLayer()
        putDuelModeLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Duel Mode scene")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on DUel Mode scene")
    }
    
}

@available(iOS 9.0, *)
extension DuelModeScene {
    private func putBackgroundLayer() {
        duelModeBackground = LaboratoryBackgroundLayer()
        duelModeBackground.putBackground()
        addChild(duelModeBackground)
    }
    private func putDuelModeLayer() {
        duelModeLayer = DuelModeLayer()
        duelModeLayer.putDuelModeLayer()
        addChild(duelModeLayer)
    }
}