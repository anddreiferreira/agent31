//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {

    var agent31 : Agent?
    var placeHolder : SKSpriteNode?
    
    var desk : LabObject?
    var computer : LabObject?
    var gunDevelopmentCenter : LabObject?
    var television : LabObject?
    var trainingCenter : LabObject?
    
    var tapObjectButton : SKSpriteNode?
    

    override init(){
        
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func putObjectPlaceHolder(){
        
        self.desk = LabObject(imageNamed: "placeHolderMesa" , groundPosition: CGPointMake(100,100))

//        self.desk = Desk(position: CGPointMake(100, 220))
//        self.computer = Computer(position: CGPointMake(-100, 220))
//        self.television = Television(position: CGPointMake(-200, 220))
//        self.trainingCenter = TrainingCenter(position: CGPointMake(-300, 220))
//        self.gunDevelopmentCenter = GunDevelopmentCenter(position: CGPointMake(-400, 220))
//
//        // Objetcs
        self.addChild(desk!)
//        self.addChild(computer!)
//        self.addChild(television!)
//        self.addChild(gunDevelopmentCenter!)
//        self.addChild(trainingCenter!)
    }
    
    func putGameLayer(){
        
        self.putGround()
        self.putAgent()
        self.putObjectPlaceHolder()
        
    }
    
    
    
    func putGround(){
        let ground = GameObject(imageName: "testCityGround", position: CGPointMake(middleOfTheScreenPoint.x, 0), zPosition: 1)
        ground.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue | ColliderType.Enemy.rawValue
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.affectedByGravity = false
        ground.alpha = 0.0
        self.addChild(ground)
    }
    
    func putAgent(){
        agent31 = Agent()
        self.addChild(agent31!)
    }
    
    func putDeskLayer(){
    
        debugPrint("Chama layer da desk")
        
    }
    
    func verifyObjectBalloon(obj: LabObject){
        if(distanceBetweenPoints(obj.position, second: (self.agent31?.position)!) < 100){
            obj.putBalloon()
        }else{
            obj.removeBalloon()
        }
    }
    
    func updateLabGameLayer(){
        self.verifyObjectBalloon(self.desk!)
    }
    
}
