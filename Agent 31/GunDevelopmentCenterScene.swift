//
//  GunDevelopmentCenterScene.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/13/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class GunDevelopmentCenterScene: SKScene
{
    private var gunDevCenterBackgroundLayer: LaboratoryBackgroundLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Gun Development Center scene")
        putBackgroundLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Gun Development Center scene")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Gun Development Center scene")
    }
}

@available(iOS 9.0, *)
extension GunDevelopmentCenterScene {
    private func putBackgroundLayer() {
        gunDevCenterBackgroundLayer = LaboratoryBackgroundLayer()
        gunDevCenterBackgroundLayer.putBackground()
        addChild(gunDevCenterBackgroundLayer)
    }
}