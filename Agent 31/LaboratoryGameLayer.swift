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
    
    var desk : SKSpriteNode?
    var computer : SKSpriteNode?
    var gunDevelopmentCenter : SKSpriteNode?
    var television : SKSpriteNode?
    var trainingCenter : SKSpriteNode?
    var duelMode: SKSpriteNode?
    
    var tapObjectButton : SKSpriteNode?
    
    var cityPlaceholder : SKSpriteNode?
    
    
    override init(){
        
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func putObjectPlaceHolder(){
        
//        self.desk = createSpriteNode("mesaPlaceholder2" , position: CGPointMake(600,375-128), name: "")
//        self.computer = createSpriteNode("pcPlaceholder2", position: CGPointMake(300, 375-127))
//        self.television = createSpriteNode( "tvPlaceholder2", groundPosition: CGPointMake(0, 375-154))
//        self.trainingCenter = createSpriteNode(imageNamed: "treinoPlaceholder2", groundPosition: CGPointMake(-300, 375-137))
//        self.gunDevelopmentCenter = createSpriteNode(imageNamed: "armaPlaceholder2", groundPosition: CGPointMake(-500, 375-119))
////        self.duelMode = LabObject(imageNamed: "placeHolderDuelMode", groundPosition: CGPointMake(-800, 375-100))
        
        
        self.desk = createSpriteNode("mesaPlaceholder2", position: CGPointMake(600,375-128), name: "desk")
        
        self.self.television = createSpriteNode("tvPlaceholder2", position: CGPointMake(0, 375-154), name: "computer")
        
        self.self.trainingCenter = createSpriteNode("treinoPlaceholder2", position:CGPointMake(-300, 375-137), name: "placeholderTreino1")
        
        self.gunDevelopmentCenter = createSpriteNode("armaPlaceholder2", position: CGPointMake(-500, 375-119), name: "placeholderGun")
        
        self.computer = createSpriteNode("pcPlaceholder2", position: CGPointMake(300, 375-127), name: "computer")

        
        self.cityPlaceholder = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(570, 375-70), zPosition: 1000, name: "goCity")
        
      
        
        self.television?.setScale(0.3)
        self.desk?.setScale(0.3)
        self.computer?.setScale(0.3)
        self.gunDevelopmentCenter?.setScale(0.3)
        self.trainingCenter?.setScale(0.3)
        
        self.addChild(desk!)
        self.addChild(computer!)
        self.addChild(television!)
        self.addChild(gunDevelopmentCenter!)
        self.addChild(trainingCenter!)
        self.addChild(cityPlaceholder!)
        
    }
    
    func putGameLayer(){
        
        self.putGround()
        self.putAgent()
        self.putObjectPlaceHolder()
        self.putTestEnemy()
    }
    
    
    
    func putGround(){

        let ground = Ground(size: CGSizeMake(5340, 100), position: CGPointMake(middleOfTheScreenPoint.x, -10), zPosition: 1)

        self.addChild(ground)
    }
    
    func putAgent(){
        agent31 = Agent(position: CGPointMake(middleOfTheScreenPoint.x, yPositionFloor),withGun: true)
        self.addChild(agent31!)
    }
    
    func verifyObjectBalloon(obj: LabObject){
        if(distanceBetweenPoints(obj.position, second: (self.agent31?.position)!) < 100){
            obj.putBalloon()
        }else{
            obj.removeBalloon()
        }
    }
    
    func putTestEnemy(){
        let testEnemy = Enemy1(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor))
//        let secEnemy = GeneralEnemy(position: CGPointMake(middleOfTheScreenPoint.x - 100, yPositionFloor), enemyLevel: 5)
//        self.addChild(testEnemy)
//        self.addChild(secEnemy)
    }
    
    func updateLabGameLayer(){
//        self.verifyObjectBalloon(self.desk!)
//        self.verifyObjectBalloon(self.computer!)
//        self.verifyObjectBalloon(self.television!)
//        self.verifyObjectBalloon(self.trainingCenter!)
//        self.verifyObjectBalloon(self.gunDevelopmentCenter!)
//        self.verifyObjectBalloon(self.duelMode!)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let node1: SKNode = contact.bodyA.node!
        let node2: SKNode = contact.bodyB.node!
        
        if(node1.isKindOfClass(Agent)){
            agent31?.didBeginContact(node2)
        }else if(node2.isKindOfClass(Agent)){
            agent31?.didBeginContact(node1)
        }
        
    }
    
}
