//
//  LaboratoryScene.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//


import SpriteKit

@available(iOS 9.0, *)
class LaboratoryScene: SKScene {

    var clock: NSTimer?
    var timeElapsed: Float = 0.0
    
    var cam = SKCameraNode()
    private var analogStick: AnalogStick!
    var jumpButton: SKSpriteNode?
    var shootButton: SKSpriteNode?
    var goToCity: SKSpriteNode?
    
    private var laboratoryBackgroundLayer : LaboratoryBackgroundLayer!
    private var laboratoryHudLayer : LaboratoryHudLayer!
    private var laboratoryGameLayer : LaboratoryGameLayer!
    
    private var gunDevelopmentCenterLayer: GunDevelopmentCenterLayer!
    private var deskLayer: DeskLayer!
    private var computerLayer: ComputerLayer!
    private var televisionLayer: TelevisionLayer!
    private var trainingCenterLayer: TrainingCenterLayer!
    private var duelMode: DuelModeLayer!

    override func didMoveToView(view: SKView) {
        print("Laboratory scene entered")
        
        // Put all necessary layers
        self.putBackgroundLayer()
        self.putHudLayer()
        self.putGameLayer()
        
        self.fireLaboratoryClock()
        
        self.configureCamera()
        
        // Physics
        self.setLaboratoryPhysics()
        
    }

    func fireLaboratoryClock() {
        self.clock = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "update2:", userInfo: timeElapsed, repeats: true)
        self.clock!.fire()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint("Touches began on Laboratory")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = (touch as UITouch).locationInNode(self)
            let node = self.nodeAtPoint(location)
            if node.name == "jumpButtonLab" {
                buttonTapped(node)
                self.laboratoryGameLayer.agent31?.jump()
            } else if node.name == "shootButton" {
                buttonTapped(node)
                self.laboratoryGameLayer.agent31?.shoot()
            } else if node.name == "goToCity" {
                buttonTapped(node)
                //self.agentGoToCity()
                self.goToTestCity()
            } else if node.name == "balloon" {
                self.showLabObjectLayer((node as? SKSpriteNode)!)
            }
        }
        
    }
    
    private func agentGoToCity() {
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
        let nextScene = CityScene(size: self.scene!.size)
        nextScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view!.presentScene(nextScene, transition: transition)
    }
    
    private func goToTestCity(){
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
        self.scene!.view!.presentScene(TestCityScene(size: self.scene!.size), transition: transition)
        self.cleanScene()
    }
    
    override func update(currentTime: CFTimeInterval) {
        self.updateCameraPosition()
    }
    
    func update2(time: CGFloat) {
        self.timeElapsed += 0.05
        self.conformAgentToAnalogic()
        self.laboratoryGameLayer.updateLabGameLayer()
    }
    
    deinit{
        print("deinit called")
    }

}

// MARK: SCENE PROCEDURES
@available(iOS 9.0, *)
extension LaboratoryScene{
    func cleanScene(){
        self.removeFromParent()
        self.removeAllActions()
        self.removeAllChildren()
        self.clock?.invalidate()
    }
}

// MARK: PUT LAYERS METHODS
@available(iOS 9.0, *)
extension LaboratoryScene {
    
    func putBackgroundLayer() {
        self.laboratoryBackgroundLayer = LaboratoryBackgroundLayer()
        self.laboratoryBackgroundLayer.putBackground()
        self.addChild(laboratoryBackgroundLayer)
    }
    
    func putHudLayer() {
        self.laboratoryHudLayer = LaboratoryHudLayer()
        self.laboratoryHudLayer.putHudLayer()
        cam.addChild(laboratoryHudLayer)
    }
    
    func putGameLayer() {
        self.laboratoryGameLayer = LaboratoryGameLayer()
        self.laboratoryGameLayer.putGameLayer()
        self.addChild(laboratoryGameLayer)
    }
    
    func showLabObjectLayer(balloon: SKSpriteNode) {
        let transition = SKTransition.revealWithDirection(SKTransitionDirection.Up, duration: 1.0)
        if(balloon.parent?.name == "placeHolderMesaArmas") {
            
        } else if (balloon.parent?.name == "placeHolderMesa") {
            debugPrint("Desk")
            
        } else if(balloon.parent?.name == "placeHolderPC") {
            debugPrint("PC")
            
        } else if(balloon.parent?.name == "placeHolderTV") {
            debugPrint("TV")
            
        } else if(balloon.parent?.name == "placeHolderTreinamento") {
            debugPrint("Training Center")
            
        } else if(balloon.parent?.name == "placeHolderDuelMode") {
            debugPrint("Duel Mode")
            let nextScene = DuelModeScene(size: self.scene!.size)
            nextScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view!.presentScene(nextScene, transition: transition)
        }
    }
}

// MARK: CAMERA
@available(iOS 9.0, *)
extension LaboratoryScene{
    
    func configureCamera(){
        cam.position = middleOfTheScreenPoint
        
        self.configureAnalogStick()
        self.loadButtons()
        
        self.addChild(cam)
        self.camera = cam
    }
    
    func updateCameraPosition(){
        
        // UPDATE X POSITION
        
        if(!(self.laboratoryGameLayer.agent31?.position.x > 382) &&
            !(self.laboratoryGameLayer.agent31?.position.x < -382)){
            self.cam.position.x = (self.laboratoryGameLayer.agent31?.position.x)!
        }
        
        //        // UPDATE Y POSITION
        //        let yPositionOfAgentInGround: CGFloat = 93.6249923706055
        //        self.cam.position.y = middleOfTheScreenPoint.y + ((self.laboratoryGameLayer.agent31?.position.y)! - yPositionOfAgentInGround)
    }
    
    private func loadButtons(){
        
        jumpButton = createSpriteNode("jumpButton", position: CGPointMake(-self.size.width/2 + 569, -self.size.height/2 + 169), zPosition: 100, name: "jumpButtonLab")
        cam.addChild(jumpButton!)
        
        goToCity = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(-self.size.width/2 + 598, -self.size.height/2 + 315), zPosition: 100, name: "goToCity")
        cam.addChild(goToCity!)
        
        shootButton = createSpriteNode("shootButton", position: CGPointMake(-self.size.width/2 + 479, -self.size.height/2 + 101), zPosition: 100, name: "shootButton")
        
        cam.addChild(shootButton!)
    }
    
}

// MARK: ANALOG METHODS
@available(iOS 9.0, *)
extension LaboratoryScene{
    
    private func configureAnalogStick(){
        // Initialize an analog stick
        analogStick = AnalogStick()
        
        analogStick.position = CGPointMake(-self.size.width/2.5, -self.size.height/3)
        analogStick!.trackingHandler = { analogStick in
            
            let xvelocity = analogStick.data.velocity.x
            self.laboratoryGameLayer.agent31!.changeVelocity(xvelocity)
            
            let yvelocity = analogStick.data.velocity.y
            self.laboratoryGameLayer.agent31!.lookUp(yvelocity)
            
            
        }
        
        cam.addChild(analogStick!)
    }
    
    func conformAgentToAnalogic() {
        if(self.laboratoryGameLayer.agent31?.velocity != 0){
            if(self.analogStick?.data.velocity == CGPointZero){
                self.laboratoryGameLayer.agent31?.changeVelocity(-1)
                self.laboratoryGameLayer.agent31?.lookUp(0)
            } else {
                let leftLimit: CGFloat = -718.0
                let rightLimit: CGFloat = 718.0
                if(!(self.laboratoryGameLayer.agent31?.position.x < leftLimit && self.analogStick?.data.velocity.x < 0) &&
                    !(self.laboratoryGameLayer.agent31?.position.x > rightLimit && self.analogStick?.data.velocity.x > 0)){
                        self.laboratoryGameLayer.agent31?.run()
                }
            }
        }
    }
}

// MARK: PHYSICS
@available(iOS 9.0, *)
extension LaboratoryScene {
    func setLaboratoryPhysics() {
        // Gravity
        self.physicsWorld.gravity = CGVectorMake(0, -6.0)
    }
}