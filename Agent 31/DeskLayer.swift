//
//  DeskLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class DeskLayer: SKNode
{
    var desk: SKSpriteNode?
    
    override init() {
        super.init()
        self.loadDesk()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDesk() {
        //desk = createSpriteNode()
        debugPrint("Load Desk layer")
    }
    
    func putDeskLayer() {
        self.addChild(desk!)
    }
    
}