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
    var begin : CGFloat
    var end : CGFloat
    
    var backgroundNumber : Int = 0
    
    init(position: CGPoint, lar : Int){
        
        largura = lar
        tileNumber = largura / 156
        
        self.begin = position.x
        self.end = position.x + CGFloat(lar)
        
        print("Criando BaseScene com posição inicial \(self.begin) e posição final \(self.end)")
        
        super.init()
        
        self.name = "cena"
        self.position = position
        self.putGround()
        self.putAllFloorSprites()

        self.manageBackground()
        self.manageBuilding()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putGround(){
        let anchorPointCorrection : CGFloat = CGFloat(self.largura) / 2.0
        
        let groundPosition = CGPointMake(anchorPointCorrection, 0)
        
        let ground = Ground(size: CGSizeMake(CGFloat(largura), 100), position: groundPosition, zPosition: zPositionsCity.GROUND.zPos)
        
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
        
        print("Criando tile com nome \(name) e \(pos)")

        let sprite = createSpriteNode(name, position: pos, anchorPoint:  CGPointZero, name: name);
        self.addChild(sprite)
    
    }

    func manageBuilding(){
    
        let predioInfo = BuildingInformation()
        
        let predioNovo : Building = Building(largura: predioInfo.largura, altura: predioInfo.altura, andares: predioInfo.qtdAndares, pilastras: 0, posicalIncialX: 0)
        
        predioNovo.zPosition = zPositionsCity.BUILDING.zPos
//        predioNovo.zPosition = 1000000000

//        self.addChild(predioNovo)
        predioNovo.setScale(1.6)
        
    }


    func manageBackground(){
    
        var mod = Int(begin - end)
        if(mod < 0){
            mod *= -1
        }
        
        backgroundNumber = ( mod / 459) + 1

        print("number \(backgroundNumber)")
        
        var point : CGPoint = CGPointZero
        var xStart : Int = 0
        
        for i in 0..<backgroundNumber {
            
            point = CGPoint(x: CGFloat(xStart) * 459, y: 0)
            
            let tileName : String = "backgroundCity"
            
            putSingleBackground(tileName, pos: point)
            
            
            xStart = i + 1
        }
        
        let larguraRandom = Int(arc4random_uniform(uint(mod))) + 1
        let randomX : CGFloat = begin + CGFloat(larguraRandom)
        
        let randomHeight : CGFloat = CGFloat(arc4random_uniform(100)) - 80.0
        
        let randomPos : CGPoint = CGPointMake(randomX, randomHeight)
    
        putBackgroundBuilding(randomPos)
        
    }
    
    func putSingleBackground(backName: String, pos : CGPoint){
    
        print("Criando background com nome \(backName) e \(pos)")
        
        let sprite = createSpriteNode(backName, position: pos, anchorPoint:  CGPointZero ,name: backName)
        
        sprite.zPosition = zPositionsCity.BACKGROUND.zPos

        self.addChild(sprite)
    }
    
    func putBackgroundBuilding(pos : CGPoint,backBuildingName : String = "backBuilding"){
    
        print("Criando background building na posicao \(pos)")
        
        let sprite = createSpriteNode(backBuildingName, position: pos, anchorPoint:  CGPointZero ,name: backBuildingName);
        
        sprite.zPosition = zPositionsCity.BACKGROUND_BUILDING.zPos
        
        self.addChild(sprite)
        
    }
    
    
}
