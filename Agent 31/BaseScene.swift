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
    let randomHeight : CGFloat = CGFloat(arc4random_uniform(100)) - 80.0

    var backgroundNumber : Int = 0
    
    var backgroundLayer : CityBackgroundLayer = CityBackgroundLayer()
    
    init(position: CGPoint, lar : Int){
        
        largura = lar
        tileNumber = largura / 156
        
        self.begin = position.x
        self.end = position.x + CGFloat(lar)
        
        print("Criando BaseScene com posição inicial \(self.begin) e posição final \(self.end)")
        
        super.init()
        
        self.name = "cena"
        self.position = position
        self.putGroundPhysic()
        self.putAllFloorSprites()

        self.manageBackground()
        self.manageBuilding()
    
        self.addChild(self.backgroundLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func putGroundPhysic(){
        let anchorPointCorrection : CGFloat = CGFloat(self.largura) / 2.0
        
        let groundPosition = CGPointMake(anchorPointCorrection, 0)
        
        let ground = Ground(size: CGSizeMake(CGFloat(largura), 100), position: groundPosition, zPosition: zPositionsCity.GROUND.rawValue)
        
        self.addChild(ground)
    }
    
    func putSpawner(){
        let xposition = Int(rand())%largura + Int(self.begin)
        
        let spawn = Spawner(position: CGPointMake(CGFloat(xposition), yPositionFloor))
        self.parent?.addChild(spawn)
    }
    
    func putAllFloorSprites(){
    
        var point : CGPoint = CGPointZero
        var xStart : Int = 0
        
        for i in 0..<tileNumber {
        
            point = CGPoint(x: CGFloat(xStart) * 156, y: 0)
            
            putSingleGround(point)
            
            xStart = i + 1
            
        }
        
    }
    
    func putSingleGround(pos : CGPoint){
        
        let tileIndex : Int = Int(arc4random_uniform(3)) + 1
        let tileName : String = "ground\(tileIndex)"

        let sprite = createSpriteNode(tileName, position: pos, anchorPoint:  CGPointZero, zPosition: zPositionsCity.GROUND.rawValue, name: tileName)
    
        self.addChild(sprite)
    
    }

    func manageBuilding(){
    
        let predioInfo = BuildingInformation()
        
        let predioNovo : Building = Building(largura: predioInfo.largura, altura: predioInfo.altura, andares: predioInfo.qtdAndares, pilastras: 0, posicalIncialX: predioInfo.posicaoInicialX)
        
        predioNovo.zPosition = zPositionsCity.BUILDING.rawValue
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
            
            self.backgroundLayer.putSingleBackground(tileName, pos: point)
            
            xStart = i + 1
        }
        
        let numberOfBackgroundBuildings : Int = 3
        
        for _ in 0..<numberOfBackgroundBuildings {
        
            let larguraRandom = Int(arc4random_uniform(uint(mod))) + 1
            let randomX : CGFloat = begin + CGFloat(larguraRandom)
            
            let randomPos : CGPoint = CGPointMake(randomX, randomHeight)
            
            self.backgroundLayer.putBackgroundBuilding(randomPos)
            
         }
        
    }
    
      

}
