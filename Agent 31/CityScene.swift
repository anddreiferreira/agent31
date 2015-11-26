//  CityScene.swift
//  Agent 31
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.

import SpriteKit

class CityScene: SKScene {
    
    private var cityGameLayer : CityGameLayer!
    private var cityBackgroundLayer : CityBackgroundLayer!
    private var cityHudLayer : CityHudLayer!
    
    override func didMoveToView(view: SKView) {
        
        debugPrint("City scene entered")
        
        self.putBackgroundLayer()
        self.putBasicHudLayer()
        self.putGameLayer()
        

        
    }
    
    func putBackgroundLayer(){
        
        self.cityBackgroundLayer = CityBackgroundLayer()
        self.cityBackgroundLayer.putBackground()
        self.addChild(cityBackgroundLayer)
        
    }
    
    func putBasicHudLayer(){
        
        self.cityHudLayer = CityHudLayer()
        self.cityHudLayer.putHudLayerCity()
        self.addChild(cityHudLayer)
    
    }
    
    func putGameLayer(){
        
        self.cityGameLayer = CityGameLayer()
        self.cityGameLayer.putGameLayer()
        self.addChild(cityGameLayer)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if node.name == "jumpButton" {
                buttonTapped(node)
            }
            
            
        }
        
    }

}