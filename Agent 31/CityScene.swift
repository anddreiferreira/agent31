//
//  CityScene.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class CityScene: SKScene {
    
    private var cityGameLayer : CityGameLayer!
    private var cityBackgroundLayer : CityBackgroundLayer!
    private var cityHudLayer : CityHudLayer!
    
    override func didMoveToView(view: SKView) {
        
        print("laboratory scene entered")
        
        self.putBackgroundLayer()
//        self.putHudLayer()
        self.putGameLayer()
        
    }
    
    func putBackgroundLayer(){
        
        self.cityBackgroundLayer = CityBackgroundLayer()
        self.cityBackgroundLayer.putBackground()
        self.addChild(cityBackgroundLayer)
        
    }
    
    func putHudLayer(){
        
//        self.laboratoryHudLayer = LaboratoryHudLayer()
//        self.laboratoryHudLayer.putHudLayer()
//        self.addChild(laboratoryHudLayer)
        
    }
    
    func putGameLayer(){
        
        self.cityGameLayer = CityGameLayer()
        self.cityGameLayer.putGameLayer()
        self.addChild(cityGameLayer)
        
    }
    
    

}