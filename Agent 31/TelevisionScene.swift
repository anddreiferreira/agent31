//
//  TelevisionScene.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/13/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class TelevisionScene: SKScene
{
    private var tvBackgroundLayer: LaboratoryBackgroundLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Television scene")
        putBackgroundLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Television scene")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Television scene")
    }
}

@available(iOS 9.0, *)
extension TelevisionScene {
    private func putBackgroundLayer() {
        tvBackgroundLayer = LaboratoryBackgroundLayer()
        tvBackgroundLayer.putBackground()
        addChild(tvBackgroundLayer)
    }
}