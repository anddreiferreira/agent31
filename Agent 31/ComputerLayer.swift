//
//  ComputerLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class ComputerLayer: SKNode
{
    var computer: SKSpriteNode?
    
    override init() {
        super.init()
        self.loadComputer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadComputer() {
        //computer = createSpriteNode()
        debugPrint("Load Computer layer")
    }
    
    func putComputerLayer() {
        self.addChild(computer!)
    }
    
}