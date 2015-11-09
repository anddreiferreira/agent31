//
//  CharacterData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

class CharacterData : NSObject {
    
    var jump: Int
    var speed: Int
    var shootingPower: Int
    var shootingRange: Int
    var backPack: Int
    var level: Int
    
    override init() {
//        super.init()
        self.jump = 0
        self.speed = 0
        self.shootingRange = 0
        self.shootingPower = 0
        self.backPack = 0
        self.level = 0
    }
    
    class func printCharacter( character: CharacterData ) {
        print( "Jump = \(character.jump)" )
        print( "Speed = \(character.speed)" )
        print( "Shooting range = \(character.shootingRange)" )
        print( "Shooting power = \(character.shootingPower)" )
        print( "Back pack = \(character.backPack)" )
        print( "Level = \(character.level)" )
    }
}


// MARK: Character Training methods
extension CharacterData {
    
    func getAttributeValue( attribute: String ) -> Int {
        if( attribute == "Jump" ) {
            return self.jump
        } else if ( attribute == "Speed" ) {
            return self.speed
        } else if ( attribute == "ShootingRange" ) {
            return self.shootingRange
        } else if ( attribute == "ShootingPower" ) {
            return self.shootingPower
        } else if ( attribute == "backPack" ) {
            return self.backPack
        } else if ( attribute == "level" ) {
            return self.level
        } else {
            return 0
        }
    }
    
    func initTraining( attribute: String ) {
        
        debugPrint( "Inicializando o treino do atributo \(attribute)" )
        let currentValue = self.getAttributeValue( attribute )
        
        // verificar o custo do treino desse atributo e e reduzir da quantidade de ouro
//        let cost = self.getCostOfTraining( attribute, value: currentValue )
        
        // recuperar o tempo necessário para o treinamento
        let time = self.getTimeOfTraining( attribute, value: currentValue )
        
        // iniciar o NSTimer e ao terminar o tempo chamar a funcao de terminar treino
        self.initTimer(time, value: currentValue)
    }
    
    func initTimer( time: Int, value: Int )
    {
        debugPrint("Inicializando o Timer do atributo")
        let timeInterval = NSTimeInterval(time)

        NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "finishTraining:", userInfo: self, repeats: false)
    }
    
    func finishTraining(timer: NSTimer) {
        
        // incrementar o valor do atributo
        debugPrint("**************** Valor do atributo atualizado com sucesso *************" )
//        debugPrint("\(GameData.sharedInstance.jump)")
        timer.invalidate()
    }
}

// MARK: stub functions to test funcionalities
extension CharacterData {
    
    func getCostOfTraining( attribute: String, value: Int ) -> Int {
        if value < 2 {
            return 300
        } else if value < 5 {
            return 600
        } else {
            return 100
        }
    }
    
    func getTimeOfTraining( attribute: String, value: Int ) -> Int {
        return 10
    }
}
