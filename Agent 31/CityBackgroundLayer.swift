//
//  CityBackgrounLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class CityBackgroundLayer: SKNode {

    var backgroundCity : SKSpriteNode?
    
    func putBackground(){
        
        backgroundCity = createSpriteNode("backgroundCityPlaceholder", anchorPoint: CGPointMake(0,0), zPosition: 0, position: CGPointMake(0, 0),name: "backgroundCity")
        self.addChild(backgroundCity!)
        
    }
    
    
}
