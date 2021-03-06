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
    
    var cityEnd: CGFloat = 0
    var cityBegin: CGFloat = -CGFloat(minimumWidthScene*baseSceneOperator)
    
    override init(){
        
        super.init()
        
        sceneTimer()
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sceneTimer(){
        let timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "manageScenes", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    
    func putGameLayer(){
        self.putInitialScenes()
        self.putAgent()
        
        self.putTestEnemy()
        
    }
    
    func putInitialScenes(){
        
        var positionOfScene = CGPointMake(-CGFloat(minimumWidthScene*baseSceneOperator), 20)
        
        for _ in 0..<5 {
            
            let base1 = BaseScene(position: positionOfScene, lar : minimumWidthScene*baseSceneOperator)
            
            self.addChild(base1)
            
            positionOfScene.x += CGFloat(minimumWidthScene*baseSceneOperator)
            cityEnd = positionOfScene.x
        }
    
    }
    
    
    func putNewScene(actualXPosition: CGFloat, direction: Int){
        // In future this will be randomized
        let sceneWidth: Int = (Int(rand()%3)+3)*baseSceneOperator
        
        
        // Calculate begining position of the new scene
        var scenePosition: CGPoint? = nil
        
        if(direction == RIGHT){
            scenePosition = CGPointMake(actualXPosition, 20)
            
            addScene(scenePosition!, width: sceneWidth)
            
            self.cityEnd += CGFloat(sceneWidth)
            
        }else if(direction == LEFT){
            scenePosition = CGPointMake(actualXPosition - CGFloat(sceneWidth), 20)
            
            addScene(scenePosition!, width: sceneWidth)
            
            let newBegin = self.cityBegin - CGFloat(sceneWidth)
            self.modifyCityBegin(newBegin)
        }
        
        
        
    }
    
    func addScene(position: CGPoint, width: Int){
        
        let newScene = BaseScene(position: position, lar: width)
        newScene.zPosition = 10
        self.addChild(newScene)
        
    }
    
    
    func createBlock(position: CGPoint){
        let block = Ground(size: CGSizeMake(500, 100), position: position, zPosition: 1)
        block.yScale = (block.yScale)/2
//        self.addChild(block)
        block.zPosition = -10000
    }
    
    func putAgent(){
        agent31 = Agent(position: CGPointMake(middleOfTheScreenPoint.x, yPositionFloor))
        agent31?.zPosition = zPositionsCity.AGENT.rawValue
        self.addChild(agent31!)

    }
    
    func putTestEnemy(){

        
//        let enemytest = Enemy1(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor), withGun: true)
//        let enemysec = Enemy2(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor), enemyLevel: 10)
//        let enemy3 = Enemy2(position: CGPointMake(middleOfTheScreenPoint.x - 300, yPositionFloor), enemyLevel: 3)
//        
//        enemytest.zPosition = 100000
//        enemysec.zPosition = 100000
//        enemy3.zPosition = 100000
//        
//        self.addChild(enemysec)
//        self.addChild(enemytest)
//        self.addChild(enemy3)
        
//        for _ in 0..<10{
//            let enemytest = Enemy1(position: CGPointMake(middleOfTheScreenPoint.x - 200, yPositionFloor), withGun: true)
//            
//            self.addChild(enemytest)
//        }
    }
    
    func calculateDistanceToAgent( enemyPosition: CGPoint ) -> CGFloat {
        return distanceBetweenPoints( self.agent31!.position, second: enemyPosition )
    }
    
    func updateEnemy(currentTime: Float){
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
    
    func update2(currentTime: Float){
//        debugPrint("CURRENT TIME \(currentTime)")
        self.updateEnemy(currentTime)
        
    }
    
    func manageScenes(){
        
        sceneGenerationHandling()
        
        spawnerHandling()
    }
    
    func sceneGenerationHandling(){
        self.enumerateChildNodesWithName("cena", usingBlock: {
            node, stop in
            // Block below is executed if a enemy is found
            
            if let scene = node as? BaseScene{
                
                if(scene.end == self.cityEnd){
                    
                    // When agent is behind the scene end
                    // The value is negative
                    // Otherwise, the value is positive
                    let xDiff = (self.agent31?.position.x)! - scene.end
                    
                    
                    if(xDiff < 0){
                        
                        let range = -500
                        
                        // If the player passed the range...
                        if(xDiff > CGFloat(range)){
                            self.putNewScene(scene.end, direction: RIGHT)
                        }
                        
                    }else if(xDiff < -4000){
                        scene.removeFromParent()
                        self.cityEnd -= CGFloat(scene.largura)
                    }
                    
                }else if(scene.begin == self.cityBegin){
                    
                    // When agent is behind the scene end
                    // The value is negative
                    // Otherwise, the value is positive
                    let xDiff = (self.agent31?.position.x)! - scene.end
                    
                    if(xDiff > 0){
                        
                        let range = 500
                        
                        if(xDiff < CGFloat(range)){
                            self.putNewScene(scene.begin, direction: LEFT)
                        }else if(xDiff > 4000){
                            let newBegin = self.cityBegin + CGFloat(scene.largura)
                            self.modifyCityBegin(newBegin)
                            scene.removeFromParent()
                        }
                    }
                    
                }
                
                
            }else{
                debugPrint("None node named 'cena' not founded")
            }
            
        })
    }
    
    func spawnerHandling(){
        self.enumerateChildNodesWithName("spawner", usingBlock: {
            node, stop in
            // Block below is executed if a enemy is found
            
            if let spawn = node as? Spawner{
                
                // Verify the proximity between spawner and agent
                let xDiff = fabs((self.agent31?.position.x)! - spawn.position.x)
                if(xDiff < 667){
                    spawn.generateEnemy()
                }
                
            }else{
                debugPrint("Node named 'spawner' not founded")
            }
            
        })
    }
    
    func modifyCityBegin(value: CGFloat){
        self.cityBegin = value
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
    
       
}