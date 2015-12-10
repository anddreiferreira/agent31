//
//  TestSceneGround.swift
//  Agent 31
//
//  Created by Henrique Dutra on 10/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class BaseScene: SKNode {

    let largura : Int = 3120
    var tileNumber : Int
    
    init(position: CGPoint){
        
        tileNumber = largura / 156
        
        super.init()
        
        self.position = position
        self.putAllGrounds()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putAllGrounds(){
    
        var point : CGPoint = self.position
        var xStart : Int
        var yStart : Int
        
        for i in 0..<tileNumber {
        
            xStart = i + 1
            yStart = i + 1
            
            point = CGPoint(x: Int(self.position.x) + (xStart * 156), y: 0)
            
            let tileIndex : Int = Int(arc4random_uniform(3)) + 1
            let tileName : String = "ground\(tileIndex)"
            
            putSingleGround(tileName, pos: point)
            

        }
        
    }
    
    func putSingleGround(name : String, pos : CGPoint){
    
        print("Minha rola")
        print(name)
        print(pos)
        
        let sprite = createSpriteNode(name, position: pos, anchorPoint:  CGPointZero, name: name);
        self.addChild(sprite)
    
    }
    
}
