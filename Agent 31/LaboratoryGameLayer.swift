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
    
    var positionsOfObjects : [CGPoint]
    
    var desk : Desk?
    var computer : Computer?
    var gunDevelopmentCenter : GunDevelopmentCenter?
    var television : Television?
    var trainingCenter : TrainingCenter?

    override init(){
        
        self.positionsOfObjects = []

        super.init()
        
        self.loadButtons()
//        self.configureAnalogStick()
        self.putObjectPlaceHolder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButtons(){
    
        jumpButtonLab = createSpriteNode("jumpButton", position: CGPointMake(537, 375-274), zPosition: 2, name: "jumpButtonLab")
        
        goToCity = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(598, 375-212), zPosition: 2, name: "goToCity")
    
    }
    
    func putObjectPlaceHolder(){

        desk = Desk(position: CGPointMake(80, 80))
        computer = Computer(position: CGPointMake(-50, -50))
        television = Television(position: CGPointMake(-50, -50))
        trainingCenter = TrainingCenter(position: CGPointMake(-50, -50))
        gunDevelopmentCenter = GunDevelopmentCenter(position: CGPointMake(-50, -50))
        
    }
    
    func configureAnalogStick(){

        analogStick = AnalogStick(diameter: 100)
        analogStick!.position = CGPointMake(30, 30)
        analogStick!.trackingHandler = { analogStick in
            
            guard let aN = self.placeHolder else { return }
            
            aN.position = CGPointMake(aN.position.x + (analogStick.data.velocity.x * 0.12), aN.position.y + (analogStick.data.velocity.y * 0.12))
        }
        self.addChild(analogStick!)
    
    
    }
    
    func putGameLayer(){
        
        putGround()
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
        
        // Store Positions of objects
        self.objectPositions()

    }
    
    func putGround(){
        let ground = GameObject(imageName: "Ground", position: CGPointMake(667/2, 0), zPosition: 1)
        ground.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.affectedByGravity = false
        self.addChild(ground)
    }
    
    func objectPositions(){
        
        let deskPosition : CGPoint = (self.desk?.positionRequiredDesk())!
        let computerPosition : CGPoint = (self.computer?.positionRequiredComputer())!
        let trainingCenterPosition : CGPoint = (self.trainingCenter?.positionRequiredTraining())!
        let gunCenterPosition : CGPoint = (self.gunDevelopmentCenter?.positionRequiredGun())!
        let televisionPosition : CGPoint = (self.television?.positionRequiredTelevision())!
        
        positionsOfObjects.append(deskPosition)
        positionsOfObjects.append(computerPosition)
        positionsOfObjects.append(trainingCenterPosition)
        positionsOfObjects.append(gunCenterPosition)
        positionsOfObjects.append(televisionPosition)
        
        for index in 0...4 {
            print(positionsOfObjects[index])
        }
        
    }
    
    func putAgent(){
        agent31Lab = Agent()
        self.addChild(agent31Lab!)
    }

}
