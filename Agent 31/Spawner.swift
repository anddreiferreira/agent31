//
//  Spawner.swift
//  Agent 31
//
//  Created by Julio Xavier on 13/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Spawner: GameObject {
    
    var canCreate = true
    var brokenAnimation: SKAction?
    
    init(position: CGPoint) {
        super.init(imageName: "window1", position: position, zPosition: zPositionsCity.BUILDING.rawValue)
        
        self.name = "spawner"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setBasicAttributes() {
        loadBrokenAnimation()
        // Spawner can't have a physics body
    }
    
    func generateEnemy(){
        
        if(canCreate){
            let level = Int(rand())%10+1
            
            let probability = Int(rand())%100+1
            
            var newEnemy: Enemy? = nil
            
            if(probability < 65){
                newEnemy = createEnemy2(level)
            }else{
                newEnemy = createEnemy1(level)
            }
            
            
            if(newEnemy != nil){
                broken()
                self.parent?.addChild(newEnemy!)
            }
            
            timeIntervalToCreateNewEnemy()
        }
    }
    
    private func createEnemy1(level: Int) -> Enemy1{
        return Enemy1(position: self.position, enemyLevel: level)
    }
    
    private func createEnemy2(level: Int) -> Enemy2 {
        return Enemy2(position: self.position, enemyLevel: level)
    }
    
    private func timeIntervalToCreateNewEnemy(){
        canCreate = false
        self.runAction(SKAction.waitForDuration(NSTimeInterval(Int(rand())%3+2)), completion: {
            self.canCreate = true
        })
    }
    
    private func loadBrokenAnimation(){
        brokenAnimation = actionWithAnimationName("window", numberOfImages: 2, timePerTexture: 0.3)
    }
    
    private func broken(){
        if(brokenAnimation != nil){
            self.runAction(brokenAnimation!)
        }
    }
    

}
