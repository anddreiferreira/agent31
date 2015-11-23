//
//  ComputerScene.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/13/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class ComputerScene: SKScene
{
    private var computerBackground: LaboratoryBackgroundLayer!
    private var computerLayer: ComputerLayer!
    
    override func didMoveToView(view: SKView) {
        debugPrint("Entered Computer scene")
        putBackgroundLayer()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Computer scene")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches ended on Computer scene")
    }
}

@available(iOS 9.0, *)
extension ComputerScene {
    private func putBackgroundLayer() {
        computerBackground = LaboratoryBackgroundLayer()
        computerBackground.putBackground()
        addChild(computerBackground)
    }
    private func putComputerLayer() {
        computerLayer = ComputerLayer()
        computerLayer.putComputerLayer()
        addChild(computerLayer)
    }
}