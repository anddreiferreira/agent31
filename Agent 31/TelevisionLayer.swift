//
//  TelevisionLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class TelevisionLayer: SKNode
{
    var television: SKSpriteNode?
    
    override init() {
        super.init()
        self.loadTelevision()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadTelevision() {
        //television = createSpriteNode()
        debugPrint("Load Television layer")
    }
    
    func putTelevisionLayer() {
        self.addChild(television!)
    }
    
}