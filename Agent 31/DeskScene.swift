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
    private var deskLayer: DeskLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Desk scene")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Desk")
        for touch in touches {
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            if node.name == "" {
                buttonTapped(node)
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Desk")
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