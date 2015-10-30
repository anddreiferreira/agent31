//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {

    var agent31Lab : Agent?
    private var analogStick : AnalogStick?
    var placeHolder : SKSpriteNode?

    private var jumpButtonLab : SKSpriteNode?
    private var goToCity : SKSpriteNode?
    private var shootButton: SKSpriteNode?
    
    var desk : Desk?
    var computer : Computer?
    var gunDevelopmentCenter : GunDevelopmentCenter?
    var television : Television?
    var trainingCenter : TrainingCenter?
    
    var tapObjectButton : SKSpriteNode?
    
    // Analog
    private var _isSetJoystickStickImage = true, _isSetJoystickSubstrateImage = true

    override init(){
        
        super.init()
        
        self.loadButtons()
        self.configureAnalogStick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadButtons(){
    
        jumpButtonLab = createSpriteNode("jumpButton", position: CGPointMake(569, 375-206), zPosition: 100, name: "jumpButtonLab")
        self.addChild(jumpButtonLab!)
        
        goToCity = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(598, 375-60), zPosition: 100, name: "goToCity")
        self.addChild(goToCity!)
        
        shootButton = createSpriteNode("shootButton", position: CGPointMake(479, 375-274), zPosition: 100, name: "shootButton")
        self.addChild(shootButton!)
    }
    
    private func putObjectPlaceHolder(){

        self.desk = Desk(position: CGPointMake(100, 220))
        self.computer = Computer(position: CGPointMake(-100, 220))
        self.television = Television(position: CGPointMake(-200, 220))
        self.trainingCenter = TrainingCenter(position: CGPointMake(-300, 220))
        self.gunDevelopmentCenter = GunDevelopmentCenter(position: CGPointMake(-400, 220))

        // Objetcs
        self.addChild(desk!)
        self.addChild(computer!)
        self.addChild(television!)
        self.addChild(gunDevelopmentCenter!)
        self.addChild(trainingCenter!)
    }
    
    func putGameLayer(){
        
        self.putGround()
        self.putAgent()
        self.putObjectPlaceHolder()
        
    }
    
    
    
    func putGround(){
        let ground = GameObject(imageName: "Ground", position: CGPointMake(667/2, 0), zPosition: 1)
        ground.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.affectedByGravity = false
        self.addChild(ground)
    }
    
    func putAgent(){
        agent31Lab = Agent()
        self.addChild(agent31Lab!)
    }
    
    private func configureAnalogStick(){
        // Initialize an analog stick
        analogStick = AnalogStick()
        
        analogStick!.trackingHandler = { analogStick in
        
            let xvelocity = analogStick.data.velocity.x
            self.agent31Lab!.changeVelocity(xvelocity)
            
            let yvelocity = analogStick.data.velocity.y
            self.agent31Lab!.lookUp(yvelocity)
            
        }
        
        addChild(analogStick!)        
    }
    
    func putDeskLayer(){
    
        
        
    }
    
    func messageTapObjectButton(number : Int){

        let pos : CGPoint = CGPointMake((self.desk?.position.x)!, (self.desk?.position.y)!+60)
        
        tapObjectButton = createSpriteNode("tapHereButton",position: pos , zPosition : 10, scale: 1.0, name: "tapHereButton")
        
        self.addChild(tapObjectButton!)
        nodeLighting(tapObjectButton!)
    
    }
   
    func removeTapObjectButton(){
    
        self.tapObjectButton?.removeFromParent()
        
    }
    
    func conformAgentToAnalogic(){
        if(self.agent31Lab?.velocity != 0){
            if(self.analogStick?.data.velocity == CGPointZero){
                self.agent31Lab?.changeVelocity(-1)
                self.agent31Lab?.lookUp(0)
            }else{
                self.agent31Lab?.run()
            }
        }
    }
    
        
}
