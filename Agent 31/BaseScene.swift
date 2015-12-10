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
    var baseBegin : Int
    var baseEnd : Int
    
    init(position: CGPoint, lar : Int){
        
        largura = lar
        tileNumber = largura / 156
        
        self.baseBegin = Int(position.x)
        self.baseEnd = Int(position.x) + lar
        
        print("Criando BaseScene \(position)")
        
        super.init()
        
        self.name = "BASE"
        self.position = position
        self.putGround()
        self.putAllFloorSprites()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putGround(){
        let anchorPointCorrection : CGFloat = CGFloat(self.largura) / 2.0
        
        let groundPosition = CGPointMake(156.0 + self.position.x + anchorPointCorrection, 0)
        
        let ground = Ground(size: CGSizeMake(CGFloat(largura), 100), position: groundPosition, zPosition: 1)
        
        self.addChild(ground)
    }
    
    func putAllFloorSprites(){
    
        var point : CGPoint = self.position
        var xStart : Int
        
        for i in 0..<tileNumber {
        
            xStart = i + 1
            
            point = CGPoint(x: self.position.x + CGFloat(xStart) * 156, y: 0)
            
            let tileIndex : Int = Int(arc4random_uniform(3)) + 1
            let tileName : String = "ground\(tileIndex)"
            
            putSingleGround(tileName, pos: point)
            
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
