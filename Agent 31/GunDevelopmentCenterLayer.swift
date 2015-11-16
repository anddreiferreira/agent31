//
//  GunDevelopmentCenterLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GunDevelopmentCenterLayer: SKNode
{
    var gunDevCenter: SKSpriteNode?
    
    override init() {
        super.init()
        loadGunDevCenter()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadGunDevCenter() {
        //gunDevCenter = createSpriteNode()
        debugPrint("Load Gun Dev Center layer")
    }
    
    func putGunDevCenterLayer() {
        addChild(gunDevCenter!)
    }

}