//
//  CharacterData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 23/11/15.
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
    case lives = "Lives"
}

private let _sharedInstance = CharacterData()

class CharacterData : NSObject {
    
    var jump: Int
    var speed: Int
    var shootingPower: Int
    var shootingRange: Int
    var backPack: Int
    var level: Int
    var lives: Int
  
    // Atributos do treinamento do Character
    var isTrainingNow: Bool
    var currentTrainingAttribute: String
    var finishTrainingDate: NSDate
    
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
        self.lives = 0
        
        self.isTrainingNow = false
        self.currentTrainingAttribute = "nil"
        self.finishTrainingDate = nilDateValue()
    }
    
    class func printCharacter( character: CharacterData ) {
        print( "Jump = \(character.jump)" )
        print( "Speed = \(character.speed)" )
        print( "Shooting range = \(character.shootingRange)" )
        print( "Shooting power = \(character.shootingPower)" )
        print( "Back pack = \(character.backPack)" )
        print( "Level = \(character.level)" )
        print( "Lives = \(character.lives)" )
        print( "IsTrainingNow = \(character.isTrainingNow)" )
        print( "CurrentTrainingAttribute = \(character.currentTrainingAttribute)" )
        print( "FinishTrainingDate = \(character.finishTrainingDate)" )
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
    
    func upgradeAttributeValue( attribute: String ) {
        
        if( attribute == Attributes.jump.rawValue ) {
            self.jump = self.jump + 1
        } else if ( attribute == Attributes.speed.rawValue ) {
            self.speed = self.speed + 1
        } else if ( attribute == Attributes.shootingRange.rawValue ) {
            self.shootingRange = self.shootingRange + 1
        } else if ( attribute == Attributes.shootingPower.rawValue ) {
            self.shootingPower = self.shootingPower + 1
        } else if ( attribute == Attributes.backPack.rawValue ) {
            self.backPack = self.backPack + 1
        } else {
            // Do nothing
        }
    }
    
    func initTraining( attribute: String ) {
        
        debugPrint( "Inicializando o treino do atributo \(attribute)" )
        // O valor atual do atributo é necessário para saber quanto tempo vai durar o treinamento
        let currentValue = self.getAttributeValue( attribute )
        
        self.currentTrainingAttribute = attribute
        isTrainingNow = true
        
        // recuperar o tempo e o custo necessário para o treinamento
        let tuple = characterLevelUp(attribute, currentAttributeLevel: currentValue)
        self.finishTrainingDate = NSDate().dateByAddingTimeInterval(tuple.timeLevelUp)
        
        // iniciar o NSTimer
        self.initTimer(tuple.timeLevelUp, currentAttributeValue: currentValue)
        
        // Salvar o finishTrainingDate, currentAttributeLevel e o isTrainingNow do Cloudkit
        let ckhelper = CloudKitHelper()
        ckhelper.saveCharacterProperties(self)
        
        // Agendar notificacao (OBS: Tem que ser de acordo com o finishTrainingDate)
        scheduleNotification(tuple.timeLevelUp, itemName: attribute, itemLevel: self.getAttributeValue(attribute))
    }
    
    private func initTimer( time: NSTimeInterval, currentAttributeValue: Int ) {
        debugPrint("Inicializando o Timer do atributo \(self.currentTrainingAttribute)")
        
        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishTraining:", userInfo: self, repeats: false)
    }
    
    func finishTraining(timer: NSTimer) {
        
        timer.invalidate()
        
        isTrainingNow = false
        self.finishTrainingDate = nilDateValue()
        
        // incrementar o valor do atributo
        self.upgradeAttributeValue( self.currentTrainingAttribute )
        self.currentTrainingAttribute = "nil"
        
        // salvar o novo valor no cloudkit
        let ck = CloudKitHelper()
        ck.saveCharacterProperties( self )
        
        debugPrint("**************** Valor do atributo \(self.currentTrainingAttribute) atualizado com sucesso *************" )
    }
}

// MARK: Character lives methods
extension CharacterData {
    
    func restoreLife() {
        
        if self.lives < 5 {
            self.lives = self.lives + 1
            debugPrint("YOU WON A LIFE")
        }
    }
    
    func decreaseLife() {
        
        if self.lives > 0 {
            self.lives = self.lives - 1
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("AgentLostOneLifeNotification", object: nil)
    }
}
