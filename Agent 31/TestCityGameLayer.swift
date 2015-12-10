//
//  TestCityGameLayer.swift
//  Agent 31
//
//  Created by Julio Xavier on 30/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

@available(iOS 9.0, *)
class TestCityGameLayer: SKNode, EnemyDelegate {
    
    var agent31 : Agent?
    
    
    override init(){
        
        super.init()
        
        self.fireClock()


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fireClock(){
        
        let timer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "createRandomEnemy", userInfo: nil, repeats: true)
        
        timer.fire()
        
    }
    
    
    func putGameLayer(){
        self.putGround()
        self.putAgent()
        
//        self.putTestEnemy()
        
//        createBlock(CGPointMake(middleOfTheScreenPoint.x/2, middleOfTheScreenPoint.y))
//        createBlock(CGPointMake(middleOfTheScreenPoint.x*2, middleOfTheScreenPoint.y*2))
    }
    
    func putGround(){
        let ground = Ground(size: CGSizeMake(5340, 100), position: CGPointMake(middleOfTheScreenPoint.x, 0), zPosition: 1)
        self.addChild(ground)
        ground.zPosition = -10000
/*        
        var positionOfGround = CGPointMake(-6240, 20)
        
        for _ in 0..<5 {
            
            let base1 = BaseScene(position: positionOfGround)
            self.addChild(base1)
            base1.zPosition = 99
        
            let ground = Ground(imageName: "placeholderChao", position: CGPointMake(CGFloat(Int(base1.position.x) + 156+(base1.largura/2)), 20),    zPosition: 1)
        
            self.addChild(ground)
            ground.zPosition = -1
            
            let x = positionOfGround.x + 3120
            let y = positionOfGround.y
            
            positionOfGround = CGPointMake(x, y)
        }
        
    }
    
    func putNewGround(){
    */
    
    }
    
    
    func createBlock(position: CGPoint){
        let block = Ground(size: CGSizeMake(500, 100), position: position, zPosition: 1)
        block.yScale = (block.yScale)/2
//        self.addChild(block)
        block.zPosition = -10000
    }
    
    func putAgent(){
        agent31 = Agent(position: CGPointMake(middleOfTheScreenPoint.x, yPositionFloor))
        agent31?.zPosition = 100
        self.addChild(agent31!)
//        print("ZZZZZZZZZZ")
//        print(self.agent31?.zPosition)
    }
    
    func putTestEnemy(){
//        let testEnemy = GeneralEnemy(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor))
//        let secEnemy = GeneralEnemy(position: CGPointMake(middleOfTheScreenPoint.x - 100, yPositionFloor), enemyLevel: 5)
//        self.addChild(testEnemy)
//        self.addChild(secEnemy)
        
        let enemytest = Enemy1(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor), withGun: true)
        let enemysec = Enemy2(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor), enemyLevel: 10)
        let enemy3 = Enemy2(position: CGPointMake(middleOfTheScreenPoint.x - 300, yPositionFloor), enemyLevel: 3)
        
        enemytest.zPosition = 100000
        enemysec.zPosition = 100000
        enemy3.zPosition = 100000
        
        self.addChild(enemysec)
        self.addChild(enemytest)
        self.addChild(enemy3)
    }
    
    func calculateDistanceToAgent( enemyPosition: CGPoint ) -> CGFloat {
        return distanceBetweenPoints( self.agent31!.position, second: enemyPosition )
    }
    
    func updateEnemy(currentTime: NSTimeInterval){
        self.enumerateChildNodesWithName("enemy", usingBlock: {
            node, stop in
            // Block below is executed if a enemy is found
            
            if let foundEnemy = node as? Enemy{
                
                foundEnemy.setDistanceToAgent( (self.agent31?.position)! )
                foundEnemy.update(currentTime)
                
            }else{
                debugPrint("Enemy isn't found")
            }
            
        })
    }

}

// MARK: CONTACT
@available(iOS 9.0, *)
extension TestCityGameLayer{
    func didBeginContact(contact: SKPhysicsContact){
        
        
        let node1: SKNode = contact.bodyA.node!
        let node2: SKNode = contact.bodyB.node!
        
        if(node1.isKindOfClass(Character)){
            self.didBeginContactWithCharacter(node1, nodeB: node2)
        }else if(node2.isKindOfClass(Character)){
            self.didBeginContactWithCharacter(node2, nodeB: node1)
        }else if(node1.isKindOfClass(Bullet)){
            (node1 as? Bullet)?.didBeginContact(node2)
        }else if(node2.isKindOfClass(Bullet)){
            (node2 as? Bullet)?.didBeginContact(node1)
        }else if(node1.isKindOfClass(Metal)){
            (node1 as? Metal)?.didBeginContact(node2)
        }else if(node2.isKindOfClass(Metal)){
            (node2 as? Metal)?.didBeginContact(node1)
        }else if(node1.isKindOfClass(Coin)){
            (node1 as? Coin)?.didBeginContact(node2)
        }else if(node2.isKindOfClass(Coin)){
            (node2 as? Coin)?.didBeginContact(node1)
        }
        
    }
    
    func didEndContact(contact: SKPhysicsContact){
        
//        let node1: SKNode = contact.bodyA.node!
//        let node2: SKNode = contact.bodyB.node!
    }
    
    func didBeginContactWithCharacter(charac: SKNode, nodeB: SKNode){
        
        if charac.isKindOfClass(Agent){
            let passHP = self.agent31?.HP
            (charac as? Agent)?.didBeginContact(nodeB)
            if(self.agent31?.HP < passHP){
                let scene = (self.parent as? TestCityScene)!
                scene.cam.runAction(scene.trembleCameraAction())
                scene.addGotHitHud()
            }
        }else{
            (charac as? Character)?.didBeginContact(nodeB)
        }
    }
    
    func createRandomEnemy(){
        
        let numRandom : Int = Int(arc4random_uniform(800)) - 300
        
        let enemytest = Enemy1(position: CGPointMake(middleOfTheScreenPoint.x - CGFloat(numRandom), yPositionFloor), withGun: true)
        
        enemytest.zPosition = 100000

//        self.addChild(enemytest)
        
    }
    
    
}
