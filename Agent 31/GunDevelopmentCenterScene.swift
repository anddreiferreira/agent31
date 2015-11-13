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
    private var gunDevelopmentCenterLayer: GunDevelopmentCenterLayer!
    var buyButton: SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Gun Development Center scene")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Gun Development Center")
        for touch in touches {
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            if node.name == "" {
                buttonTapped(node)
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Gun Development Center")
        for touch in touches {
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            if node.name == "" {
                buttonTapped(node)
            } else if node.name == "" {
                buttonTapped(node)
            }
        }
    }
}

@available(iOS 9.0, *)
extension GunDevelopmentCenterScene {
    private func putBackgroundLayer() {
        gunDevelopmentCenterLayer = GunDevelopmentCenterLayer()
        gunDevelopmentCenterLayer.putGunDevelopmentCenterBackground()
        self.addChild(gunDevelopmentCenterLayer)
    }
}