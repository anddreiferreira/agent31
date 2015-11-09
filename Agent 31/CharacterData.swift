//
//  CharacterData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

private let _sharedInstance = CharacterData()

class CharacterData : NSObject {
    
    var jump: Int
    var speed: Int
    var shootingPower: Int
    var shootingRange: Int
    var backPack: Int
    var level: Int
    
    class var sharedInstance: CharacterData {
        return _sharedInstance
    }
    
    private override init() {
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
    
    func setAttributeValue( attribute: String, value: Int ) {
        if( attribute == "Jump" ) {
            self.jump = value
        } else if ( attribute == "Speed" ) {
            self.speed = value
        } else if ( attribute == "ShootingRange" ) {
            self.shootingRange = value
        } else if ( attribute == "ShootingPower" ) {
            self.shootingPower = value
        } else if ( attribute == "backPack" ) {
            self.backPack = value
        } else if ( attribute == "level" ) {
            self.level = value
        } else {
            // Do nothing
        }
    }
    
    func initTraining( attribute: String ) {
        
        debugPrint( "Inicializando o treino do atributo \(attribute)" )
        let currentValue = self.getAttributeValue( attribute )
        
        // recuperar o tempo e o custo necessário para o treinamento
        let tuple = self.characterLevelUp( attribute, value: currentValue )
        
        // iniciar o NSTimer
        self.initTimer(tuple.time, value: currentValue)
    }
    
    func initTimer( time: NSTimeInterval, value: Int )
    {
        debugPrint("Inicializando o Timer do atributo")
//        let timeInterval = NSTimeInterval(time)

        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishTraining:", userInfo: self, repeats: false)
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
    
    // STUB para a funcao que o Artaxexes esta fazendo
    func characterLevelUp( attribute: String, value: Int ) -> ( time: NSTimeInterval, cost: Int ) {
        var ncost = 0
        let ntime = NSTimeInterval(10)
        
        if value < 2 {
            ncost = 300
        } else if value < 5 {
            ncost = 600
        } else {
            ncost = 100
        }
        
        return (ntime, ncost)

    }
}
