//
//  TestCityScene.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class TestCityScene: SKScene {
    
    private var cityGameLayer : TestCityGameLayer!
    private var cityBackgroundLayer : CityBackgroundLayer!
    private var cityHudLayer : CityHudLayer!
    
    private var analogStick: AnalogStick!
    var jumpButton : SKSpriteNode?
    var shootButton : SKSpriteNode?
    
    var cam = SKCameraNode()
    
    override func didMoveToView(view: SKView) {
        
        debugPrint("ENTERED IN TEST CITY")
        
        cam.position = middleOfTheScreenPoint
        
        self.putBackgroundLayer()
        self.putBasicHudLayer()
        self.putGameLayer()
        
        self.configureAnalogStick()
        self.loadButtons()
        
        self.addChild(cam)
        self.camera = cam
        
    }
    
    func loadButtons(){
        
        jumpButton = createSpriteNode("jumpButton", position: CGPointMake(-self.size.width/2 + 569, -self.size.height/2 + 169), zPosition: 3, name: "jumpButton")
        cam.addChild(jumpButton!)
        
        shootButton = createSpriteNode("shootButton", position: CGPointMake(-self.size.width/2 + 479, -self.size.height/2 + 101), zPosition: 100, name: "shootButton")
        cam.addChild(shootButton!)
        
    }
    
    private func configureAnalogStick(){
        // Initialize an analog stick
        analogStick = AnalogStick()
        
        analogStick.position = CGPointMake(-self.size.width/2.5, -self.size.height/3)
        analogStick!.trackingHandler = { analogStick in
            
            let xvelocity = analogStick.data.velocity.x
            self.cityGameLayer.agent31!.changeVelocity(xvelocity)
            
            let yvelocity = analogStick.data.velocity.y
            self.cityGameLayer.agent31!.lookUp(yvelocity)
            
            
        }
        
        cam.addChild(analogStick!)
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
    
    func conformAgentToAnalogic(){
                if(self.cityGameLayer.agent31?.velocity != 0){
                    if(self.analogStick?.data.velocity == CGPointZero){
                        self.cityGameLayer.agent31?.changeVelocity(-1)
                        self.cityGameLayer.agent31?.lookUp(0)
                    }else{
                        self.cityGameLayer.agent31?.run()
                    }
                }
    }
    
    override func update(currentTime: NSTimeInterval) {
        self.conformAgentToAnalogic()
        self.cam.position.x = (self.cityGameLayer.agent31?.position.x)!
    }

}