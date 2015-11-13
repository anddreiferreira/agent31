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
    var gunDevelopmentCenter: SKSpriteNode?
    
    override init() {
        super.init()
        self.loadGunDevelopment()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadGunDevelopment() {
        //gunDevelopmentCenter = createSpriteNode()
        debugPrint("Load Gun Development Center layer")
    }
    
    func putGunDevelopmentCenterLayer() {
        self.addChild(gunDevelopmentCenter!)
    }

}