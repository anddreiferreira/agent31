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
    var timeLevelUp = NSTimeInterval()
    var isTrainingNow = false
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
        self.lives = 0
    }
    
    class func printCharacter( character: CharacterData ) {
        print( "Jump = \(character.jump)" )
        print( "Speed = \(character.speed)" )
        print( "Shooting range = \(character.shootingRange)" )
        print( "Shooting power = \(character.shootingPower)" )
        print( "Back pack = \(character.backPack)" )
        print( "Level = \(character.level)" )
        print( "Lives = \(character.lives)" )
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
        } else {
            // Do nothing
        }
    }
    
    func initTraining( attribute: String ) {
        
        debugPrint( "Inicializando o treino do atributo \(attribute)" )
        let currentValue = self.getAttributeValue( attribute )
        
        self.currentTrainingAttribute = attribute
        isTrainingNow = true
        
        // recuperar o tempo e o custo necessário para o treinamento
        let tuple = characterLevelUp(attribute, currentAttributeLevel: currentValue)
        // iniciar o NSTimer
        timeLevelUp = tuple.timeLevelUp
        initTimer(timeLevelUp, value: currentValue)
        // Agendar notificacao
        scheduleNotification(tuple.timeLevelUp, itemName: attribute, itemLevel: self.getAttributeValue(attribute))
    }
    
    private func initTimer(time: NSTimeInterval, value: Int) {
        debugPrint("Inicializando o timer do atributo \(self.currentTrainingAttribute)")
        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishTraining:", userInfo: self, repeats: false)
    }
    
    func finishTraining(timer: NSTimer) {
        timer.invalidate()
        isTrainingNow = false
        // incrementar o valor do atributo
        let attrValue = self.getAttributeValue(self.currentTrainingAttribute)
        self.setAttributeValue( self.currentTrainingAttribute, value: attrValue + 1)
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
