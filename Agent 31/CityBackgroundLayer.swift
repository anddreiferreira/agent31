//
//  CityBackgrounLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class CityBackgroundLayer: SKNode {

    var background : SKNode
    var backgroundBuilding : SKNode
    
    override init() {
    
        background = SKNode()
        backgroundBuilding = SKNode()
        
        super.init()
    
        self.addChild(background)
        self.addChild(backgroundBuilding)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putSingleBackground(backName: String, pos : CGPoint){
        
        print("Criando background com nome \(backName) e \(pos)")
        
        let sprite = createSpriteNode(backName, position: pos, anchorPoint:  CGPointZero ,name: backName)
        
        sprite.zPosition = zPositionsCity.BACKGROUND.rawValue
        
        self.background.addChild(sprite)
    }
    
    func putBackgroundBuilding(pos : CGPoint,backBuildingName : String = "backBuilding"){
        
        print("Criando background building na posicao \(pos)")
        
        let sprite = createSpriteNode(backBuildingName, position: pos, anchorPoint:  CGPointZero ,name: backBuildingName);
        
        sprite.zPosition = zPositionsCity.BACKGROUND_BUILDING.rawValue
        
        self.addChild(sprite)
        
    }

    
}
