//
//  TestCityScene.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class TestCityScene: SKScene, SKPhysicsContactDelegate{
    
    var gameOver: Bool = false
    
    var clock: NSTimer?
    
    // Delete this when the city and the enemy`s generator are finished
    //    var cityTimer: NSTimer?  // This timer will decrease the secondsToBackToLab variable
    //    var secondsToBackToLab: Int = 10  // The time to play in the city
    
    var timeElapsed: Float = 0.0
    private var cityGameLayer : TestCityGameLayer!
    private var cityBackgroundLayer : CityBackgroundLayer!
    
    var cam = SKCameraNode()
    private var analogStick: AnalogStick!
    var jumpButton : SKSpriteNode?
    var shootButton : SKSpriteNode?
    
    var gotHitHud = createSpriteNode("gotHitScreen", position: CGPointMake(0, 0), anchorPoint: CGPointMake(0.5, 0.5), scale: 1.0, zPosition: 1000, name: "gotHitHud")
    
    override func didMoveToView(view: SKView) {
        
        debugPrint("ENTERED IN TEST CITY")
        
        self.putLayers()
        self.setPhysicsWorld()
        
        self.fireClock()
        
        self.configureCamera()
        
        self.backgroundColor = UIColor(red: 255/255.0, green: 239/255.0, blue: 130/255.0, alpha: 1)
        
        // criacao de informacoes randomicas do novo predio
        let predioInfo = BuildingInformation()
        
        let predioNovo : Building = Building(largura: predioInfo.largura, altura: predioInfo.altura, andares: predioInfo.qtdAndares, pilastras: 0, posicalIncialX: 0)
        
        
        predioNovo.zPosition = 0;
        //        predioInfo.posicaoInicialX
        //        self.addChild(predioNovo)
        predioNovo.setScale(1.6)
        
        
    }
    
    
    func fireClock(){
        self.clock = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "update2:", userInfo: timeElapsed, repeats: true)
        clock!.fire()
        
        // Delete this when the city and the enemy`s generator are finished
        //         Timer to decrease the time to stay in the city(secondsToBackToLab variable)
        //        self.cityTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "reduceTime", userInfo: secondsToBackToLab, repeats: true)
        //        cityTimer?.fire()
    }
    
    //    // Delete this when the city and the enemy`s generator are finished
    //    func reduceTime() {
    //        self.secondsToBackToLab = self.secondsToBackToLab - 1
    //
    //        if( self.secondsToBackToLab < 0 ) {
    //            goToLab()
    //        }
    //    }
    
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
    
    func goToLab(){
        
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
        let nextScene = LaboratoryScene(size: self.scene!.size)
        nextScene.scaleMode = SKSceneScaleMode.AspectFill
        self.view?.presentScene(nextScene, transition: transition)
        self.cleanScene()
        
        // Saving resources collected into cloudkit
        let ckhelper = CloudKitHelper()
        ckhelper.saveResourcesProperties(ResourcesData.sharedInstance)
        //ckhelper.saveResourcesProperties(ResourcesData.sharedInstance.gold, metal: ResourcesData.sharedInstance.metal, diamond: ResourcesData.sharedInstance.diamond)
    }
    
    override func update(currentTime: NSTimeInterval) {
        self.updateCameraPosition()
    }
    
    func update2(currentTime: Float){
        
        self.timeElapsed += 0.05
        self.conformAgentToAnalogic()
        self.cityGameLayer.update2(timeElapsed)
        
        if(self.cityGameLayer.agent31?.HP <= 0 && self.gameOver == false){
            self.gameOver = true
            goToLab()
        }
        
    }
    
    
    
}

// MARK: SCENE PROCEDURES
@available(iOS 9.0, *)
extension TestCityScene{
    private func cleanScene(){
        self.removeFromParent()
        self.removeAllActions()
        self.removeAllChildren()
        self.clock?.invalidate()
        //          self.cityTimer?.invalidate()
    }
}

// MARK: PUT LAYERS METHODS
@available(iOS 9.0, *)
extension TestCityScene{
    
    private func putLayers(){
        self.putGameLayer()
    }
    
    
    private func putGameLayer(){
        
        self.cityGameLayer = TestCityGameLayer()
        self.cityGameLayer.putGameLayer()
        self.addChild(cityGameLayer)
        
    }
}

// MARK: CAMERA
@available(iOS 9.0, *)
extension TestCityScene{
    
    func configureCamera(){
        cam.position = middleOfTheScreenPoint
        
        self.configureAnalogStick()
        self.loadButtons()
        
        self.addChild(cam)
        self.camera = cam
    }
    
    func updateCameraPosition(){
        let yPositionOfAgentInGround: CGFloat = 93.6249923706055
        self.cam.position.x = (self.cityGameLayer.agent31?.position.x)!
        self.cam.position.y = middleOfTheScreenPoint.y + ((self.cityGameLayer.agent31?.position.y)! - yPositionOfAgentInGround)
    }
    
    func loadButtons(){
        
        let zValue = zPositionsCity.HUD.zPos
        
        jumpButton = createSpriteNode("jumpButton", position: CGPointMake(-middleOfTheScreenPoint.x + 580, -middleOfTheScreenPoint.y + 140), zPosition: zValue, name: "jumpButton")
        cam.addChild(jumpButton!)
        
        shootButton = createSpriteNode("shootButton", position: CGPointMake(-middleOfTheScreenPoint.x + 520, -middleOfTheScreenPoint.y + 80), zPosition: zValue, name: "shootButton")
        cam.addChild(shootButton!)
        
//        let status : SKSpriteNode = createSpriteNode("statusBar", position: CGPointMake(10, 375-10), zPosition: 1000000, name: "statusBar")
        
//        cam.addChild(status)
        
    }
    
    func trembleCameraAction() -> SKAction{
        let trembleA = SKAction.rotateByAngle(0.008, duration: 0.1)
        let trembleA2 = SKAction.reversedAction(trembleA)
        let trembleB = SKAction.rotateByAngle(-0.008, duration: 0.1)
        let trembleB2 = SKAction.reversedAction(trembleB)
        
        let sequence = SKAction.sequence([trembleA, trembleA2(), trembleB, trembleB2()])
        
        return sequence
    }
    
    func addGotHitHud(){
        if(self.gotHitHud.parent == nil){
            self.cam.addChild(gotHitHud)
            self.runAction(SKAction.waitForDuration(0.1), completion: {
                self.gotHitHud.removeFromParent()
            })
        }
    }
}

// MARK: ANALOG METHODS
@available(iOS 9.0, *)
extension TestCityScene{
    
    private func configureAnalogStick(){
        // Initialize an analog stick
        analogStick = AnalogStick()
        analogStick.alpha = 0.3

        analogStick.position = CGPointMake(-self.size.width/2.5, -self.size.height/3)
        
        analogStick!.trackingHandler = { analogStick in
            
            analogStick.alpha = 1.0
            
            let xvelocity = analogStick.data.velocity.x
            self.cityGameLayer.agent31!.changeVelocity(xvelocity)
            
            let yvelocity = analogStick.data.velocity.y
            self.cityGameLayer.agent31!.lookUp(yvelocity)
            
            
        }
        analogStick!.zPosition = 1000000000
        cam.addChild(analogStick!)
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
    
}

// MARK: PHYSICS
@available(iOS 9.0, *)
extension TestCityScene{
    
    func setPhysicsWorld(){
        self.physicsWorld.gravity = CGVectorMake(0.0, -6.0)
        
        // Set the physics world delegate
        self.physicsWorld.contactDelegate = self
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        self.cityGameLayer.didBeginContact(contact)
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        self.cityGameLayer.didEndContact(contact)
    }
    
}