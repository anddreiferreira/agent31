//
//  DuelModeLayer.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/17/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class DuelModeLayer: SKNode
{
    var duelModeLayer: SKSpriteNode?
    
    override init() {
        super.init()
        loadDuelMode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDuelMode() {
        //duelMode = createSpriteNode()
        debugPrint("Duel Mode layer")
    }
    
    func putDuelModeLayer() {
        addChild(duelModeLayer!)
    }
    
}