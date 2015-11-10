//
//  CharacterData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

enum Attributes: String {
    case jump = "Jump"
    case speed = "Speed"
    case shootingRange = "ShootingRange"
    case shootingPower = "ShootingPower"
    case backPack = "BackPack"
    case level = "Level"
}

private let _sharedInstance = CharacterData()

class CharacterData : NSObject {
    
    var jump: Int
    var speed: Int
    var shootingPower: Int
    var shootingRange: Int
    var backPack: Int
    var level: Int
    private var currentTrainingAttribute = ""
    
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
        if( attribute == Attributes.jump.rawValue ) {
            return self.jump
        } else if ( attribute == Attributes.speed.rawValue ) {
            return self.speed
        } else if ( attribute == Attributes.shootingRange.rawValue ) {
            return self.shootingRange
        } else if ( attribute == Attributes.shootingPower.rawValue ) {
            return self.shootingPower
        } else if ( attribute == Attributes.backPack.rawValue ) {
            return self.backPack
        } else if ( attribute == Attributes.level.rawValue ) {
            return self.level
        } else {
            return 0
        }
    }
    
    func setAttributeValue( attribute: String, value: Int ) {
        if( attribute == Attributes.jump.rawValue ) {
            self.jump = value
        } else if ( attribute == Attributes.speed.rawValue ) {
            self.speed = value
        } else if ( attribute == Attributes.shootingRange.rawValue ) {
            self.shootingRange = value
        } else if ( attribute == Attributes.shootingPower.rawValue ) {
            self.shootingPower = value
        } else if ( attribute == Attributes.backPack.rawValue ) {
            self.backPack = value
//            OBS: THERE'IS NO SET TO LEVEL ATTRIBUTE, IT WILL BE CALCULATED
//        } else if ( attribute == "level" ) {
//            self.level = value
        } else {
            // Do nothing
        }
    }
    
    func initTraining( attribute: String ) {
        
        debugPrint( "Inicializando o treino do atributo \(attribute)" )
        let currentValue = self.getAttributeValue( attribute )
        
        self.currentTrainingAttribute = attribute
        
        // recuperar o tempo e o custo necessário para o treinamento
        let tuple = self.characterLevelUp( attribute, value: currentValue )
        
        // iniciar o NSTimer
        self.initTimer(tuple.time, value: currentValue)
    }
    
    private func initTimer( time: NSTimeInterval, value: Int )
    {
        debugPrint("Inicializando o Timer do atributo \(self.currentTrainingAttribute)")

        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishTraining:", userInfo: self, repeats: false)
    }
    
    func finishTraining(timer: NSTimer) {
        
        timer.invalidate()
        
        // incrementar o valor do atributo
        let attrValue = self.getAttributeValue( self.currentTrainingAttribute )
        self.setAttributeValue( self.currentTrainingAttribute, value: attrValue + 1 )
        
        // salvar o novo valor no cloudkit
        let ck = CloudKitHelper()
        ck.saveCharacterProperties( self )
        
        debugPrint("**************** Valor do atributo \(self.currentTrainingAttribute) atualizado com sucesso *************" )
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
