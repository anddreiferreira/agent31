//
//  TestCityScene.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class TestCityScene: SKScene {
    private var cityGameLayer : TestCityGameLayer!
    private var cityBackgroundLayer : CityBackgroundLayer!
    private var cityHudLayer : CityHudLayer!
    
    override func didMoveToView(view: SKView) {
        
        debugPrint("ENTERED IN TEST CITY")
        
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
        
        self.cityGameLayer = TestCityGameLayer()
        self.cityGameLayer.putGameLayer()
        self.addChild(cityGameLayer)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if node.name == "jumpButton" {
                buttonTapped(node)
                self.cityGameLayer.agent31!.jump()
            }else if node.name == "shootButton"{
                buttonTapped(node)
                self.cityGameLayer.agent31!.shoot()
            }
        }
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        self.cityGameLayer.conformAgentToAnalogic()
    }

}
