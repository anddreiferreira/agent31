//
//  TestSceneGround.swift
//  Agent 31
//
//  Created by Henrique Dutra on 10/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class BaseScene: SKNode {

    var largura : Int
    var tileNumber : Int
    var begin : CGPoint
    var end : CGPoint
    
    init(position: CGPoint, lar : Int){
        
        largura = lar
        tileNumber = largura / 156
        
        self.begin = CGPointMake(position.x, position.y)
        self.end = CGPointMake(position.x + CGFloat(lar), position.y)
        
        print("Criando BaseScene com posição inicial \(self.begin) e posição final \(self.end)")
        
        
        super.init()
        
        self.name = "cena"
        self.position = position
        self.putGround()
        self.putAllFloorSprites()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putGround(){
        let anchorPointCorrection : CGFloat = CGFloat(self.largura) / 2.0
        
        let groundPosition = CGPointMake(anchorPointCorrection, 0)
        
        let ground = Ground(size: CGSizeMake(CGFloat(largura), 100), position: groundPosition, zPosition: 1)
        
        self.addChild(ground)
    }
    
    func putAllFloorSprites(){
    
        var point : CGPoint = CGPointZero
        var xStart : Int = 0
        
        for i in 0..<tileNumber {
        
            
            point = CGPoint(x: CGFloat(xStart) * 156, y: 0)
            
            let tileIndex : Int = Int(arc4random_uniform(3)) + 1
            let tileName : String = "ground\(tileIndex)"
            
            putSingleGround(tileName, pos: point)
            
            xStart = i + 1
            
        }
        
    }
    
    func putSingleGround(name : String, pos : CGPoint){
    
//        print(name)
//        print(pos)
        
        print("Criando tile com nome \(name) e \(pos)")

        let sprite = createSpriteNode(name, position: pos, anchorPoint:  CGPointZero, name: name);
        self.addChild(sprite)
    
    }
    
}
