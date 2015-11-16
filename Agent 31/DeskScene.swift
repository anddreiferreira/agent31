//
//  DeskScene.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/13/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class DeskScene: SKScene
{
    private var deskBackground: LaboratoryBackgroundLayer!
    private var deskLayer: DeskLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Desk scene")
        putBackgroundLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Desk scene")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Desk scene")
    }
}

@available(iOS 9.0, *)
extension DeskScene {
    private func putBackgroundLayer() {
        deskBackground = LaboratoryBackgroundLayer()
        deskBackground.putBackground()
        addChild(deskBackground)
    }
    private func putDeskLayer() {
        deskLayer = DeskLayer()
        deskLayer.putDeskLayer()
        addChild(deskLayer)
    }
}