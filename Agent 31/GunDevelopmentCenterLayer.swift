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
    
    func putGunDevelopmentCenterBackground() {
//        let background = GameObject(imageName: "testCityBackground", position: CGPointMake(middleOfTheScreenPoint.x, 0), zPosition: 1)
//        self.addChild(background)
        debugPrint("putGunDevelopmentCenterBackground entered")
        gunDevelopmentCenter = createSpriteNode("testCityBackground", anchorPoint: CGPointMake(0,0), zPosition: 0, position: CGPointMake(0, 0),name: "backgroundCity")
        self.addChild(gunDevelopmentCenter!)
    }
    
    func loadGunDevelopment() {
        debugPrint("Load Gun Development Center layer")
        gunDevelopmentCenter = createSpriteNode("testCityBackground", anchorPoint: CGPointMake(0,0), zPosition: 0, position: CGPointMake(0, 0),name: "backgroundCity")
        self.addChild(gunDevelopmentCenter!)
    }
    
    func putGunDevelopmentCenterLayer() {
        self.addChild(gunDevelopmentCenter!)
    }

}