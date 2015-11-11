//
//  TestCityScene.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class TestCityScene: SKScene, SKPhysicsContactDelegate {
    
    var timeElapsed: Float = 0.0
    private var cityGameLayer : TestCityGameLayer!
    private var cityBackgroundLayer : CityBackgroundLayer!
    private var cityHudLayer : CityHudLayer!
    
    var cam = SKCameraNode()
    private var analogStick: AnalogStick!
    var jumpButton : SKSpriteNode?
    var shootButton : SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        
        debugPrint("ENTERED IN TEST CITY")
        
        
        self.putBackgroundLayer()
        self.putBasicHudLayer()
        self.putGameLayer()
        
        self.fireClock()
        
        self.configureCamera()
        
        // Set the physics world delegate
        self.physicsWorld.contactDelegate = self
        
    }
    
    // MARK: SKPhysicsContactDelegate methods
    func didBeginContact(contact: SKPhysicsContact){
        
        let node1: SKNode = contact.bodyA.node!
        let node2: SKNode = contact.bodyB.node!
        
        if(node1.isKindOfClass(Bullet) || node2.isKindOfClass(Bullet)){
            debugPrint("Contato com bala!")
        }
    }
    
    
    func configureCamera(){
        cam.position = middleOfTheScreenPoint
        
        self.configureAnalogStick()
        self.loadButtons()
        
        self.addChild(cam)
        self.camera = cam
    }
    
    func fireClock(){
        let clock = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "update2:", userInfo: timeElapsed, repeats: true)
        clock.fire()
    }
    
    func setPhysicsWorld(){
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -6.0)
        
        // Set the physics world delegate
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
    
    func updateCameraPosition(){
        let yPositionOfAgentInGround: CGFloat = 93.6249923706055
        self.cam.position.x = (self.cityGameLayer.agent31?.position.x)!
        self.cam.position.y = middleOfTheScreenPoint.y + ((self.cityGameLayer.agent31?.position.y)! - yPositionOfAgentInGround)
    }
    
    override func update(currentTime: NSTimeInterval) {
        self.updateCameraPosition()
    }
    
    func update2(currentTime: NSTimeInterval){
        self.timeElapsed += 0.5
        self.conformAgentToAnalogic()
        self.cityGameLayer.updateEnemy(currentTime)
    }

}
