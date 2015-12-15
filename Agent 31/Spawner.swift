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
    
    init(position: CGPoint) {
        super.init(imageName: "door", position: position, zPosition: zPositionsCity.BUILDING.rawValue)
        
        self.name = "spawner"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setBasicAttributes() {
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
                self.parent?.addChild(newEnemy!)
            }
            
            timeIntervalToCreateNewEnemy()
        }
    }
    
    func createEnemy1(level: Int) -> Enemy1{
        return Enemy1(position: self.position, enemyLevel: level)
    }
    
    func createEnemy2(level: Int) -> Enemy2 {
        return Enemy2(position: self.position, enemyLevel: level)
    }
    
    func timeIntervalToCreateNewEnemy(){
        canCreate = false
        self.runAction(SKAction.waitForDuration(NSTimeInterval(Int(rand())%3+2)), completion: {
            self.canCreate = true
        })
    }

}
