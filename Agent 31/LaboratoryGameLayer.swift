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
    
    var desk : Desk?
    var computer : Computer?
    var gunDevelopmentCenter : GunDevelopmentCenter?
    var television : Television?
    var trainingCenter : TrainingCenter?
    
    var tapObjectButton : SKSpriteNode?
    

    override init(){
        
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        ground.alpha = 0.0
        self.addChild(ground)
    }
    
    func putAgent(){
        agent31 = Agent()
        self.addChild(agent31!)
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
    
        
}
