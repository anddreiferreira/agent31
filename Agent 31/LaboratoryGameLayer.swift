//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {

    var testCharacter: Character?
    var agent31Lab : Agent?
    private var analogStick : AnalogStick?
    var placeHolder : SKSpriteNode?

    private var jumpButtonLab : SKSpriteNode?
    private var goToCity : SKSpriteNode?
    
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
        self.putObjectPlaceHolder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadButtons(){
    
        jumpButtonLab = createSpriteNode("jumpButton", position: CGPointMake(537, 375-274), zPosition: 100, name: "jumpButtonLab")
        
        goToCity = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(598, 375-212), zPosition: 100, name: "goToCity")

    }
    
    private func putObjectPlaceHolder(){

        desk = Desk(position: CGPointMake(100, 220))
        computer = Computer(position: CGPointMake(-100, 220))
        television = Television(position: CGPointMake(-200, 220))
        trainingCenter = TrainingCenter(position: CGPointMake(-300, 220))
        gunDevelopmentCenter = GunDevelopmentCenter(position: CGPointMake(-400, 220))

    }
    
    func putGameLayer(){
        
        putGround()
//        putTestCharacter()
        putAgent()

        // Buttons
        self.addChild(jumpButtonLab!)
        self.addChild(goToCity!)
        
        // Objetcs
        self.addChild(desk!)
        self.addChild(computer!)
        self.addChild(television!)
        self.addChild(gunDevelopmentCenter!)
        self.addChild(trainingCenter!)
        
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
    
    func putTestCharacter(){
        //        self.testCharacter = Character(imageName: "pernasParado1")
        self.addChild(self.testCharacter!)
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
    
        tapObjectButton?.removeFromParent()
        
    }
    
    func conformAgentToAnalogic(){
        if(self.agent31Lab?.velocity != 0){
            if(self.analogStick?.data.velocity == CGPointZero){
                self.agent31Lab?.changeVelocity(-1)
            }else{
                self.agent31Lab?.run()
            }
        }
    }
    
        
}
