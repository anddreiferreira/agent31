//
//  GunData.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 12/1/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

/*
enum Attributes: String {
case jump = "Jump"
case speed = "Speed"
case shootingRange = "ShootingRange"
case shootingPower = "ShootingPower"
case backPack = "BackPack"
case level = "Level"
}
*/

private let _sharedInstance = GunData()

class GunData: NSObject
{
    
    var gun1: String
    var gun2: String
    
    var isTrainingNow = false
    
    private var currentUpgradingGun = ""
    
    private override init() {
        self.gun1 = ""
        self.gun2 = ""
    }
    
    class func printCharacter(character: GunData) {
        //print( "Level = \(character.level)" )
    }
    
    class var sharedInstance: GunData {
        return _sharedInstance
    }
}


// MARK: Gun upgrading methods
extension GunData {
    
    func getGunValue(attribute: String) -> Int {
        //        if(attribute == Attributes.jump.rawValue ) {
        //            return self.jump
        //        } else if ( attribute == Attributes.speed.rawValue ) {
        //            return self.speed
        //        } else if ( attribute == Attributes.shootingRange.rawValue ) {
        //            return self.shootingRange
        //        } else if ( attribute == Attributes.shootingPower.rawValue ) {
        //            return self.shootingPower
        //        } else if ( attribute == Attributes.backPack.rawValue ) {
        //            return self.backPack
        //        } else if ( attribute == Attributes.level.rawValue ) {
        //            return self.level
        //        } else {
        //            return 0
        //        }
    }
    
    func setGunValue(attribute: String, value: Int) {
        //        if( attribute == Attributes.jump.rawValue ) {
        //            self.jump = value
        //        } else if ( attribute == Attributes.speed.rawValue ) {
        //            self.speed = value
        //        } else if ( attribute == Attributes.shootingRange.rawValue ) {
        //            self.shootingRange = value
        //        } else if ( attribute == Attributes.shootingPower.rawValue ) {
        //            self.shootingPower = value
        //        } else if ( attribute == Attributes.backPack.rawValue ) {
        //            self.backPack = value
        //        } else {
        //            // Do nothing
        //        }
    }
    
    func initTraining(gun: String) {
        
        debugPrint("Inicializando o upgrade da arma \(gun)" )
        //let currentValue = self.getAttributeValue(gun)
        
        self.currentUpgradingGun = gun
        isTrainingNow = true
        
        // recuperar o tempo e o custo necessário para o treinamento
        let tuple = characterLevelUp(gun, currentGunLevel: currentValue)
        // iniciar o NSTimer
        self.initTimer(tuple.timeLevelUp, value: currentValue)
        // Agendar notificacao
        scheduleNotification(tuple.timeLevelUp, itemName: gun, itemLevel: self.getGunValue(gun), badge: 1)
    }
    
    private func initTimer( time: NSTimeInterval, value: Int ) {
        debugPrint("Inicializando o Timer do atributo \(self.currentUpgradingGun)")
        
        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishTraining:", userInfo: self, repeats: false)
    }
    
    func finishTraining(timer: NSTimer) {
        
        timer.invalidate()
        
        isTrainingNow = false
        
        // incrementar o valor do atributo
        let attrValue = self.getGunValue( self.currentUpgradingGun)
        self.setGunValue(self.currentUpgradingGun, value: attrValue + 1 )
        
        // salvar o novo valor no cloudkit
        let ck = CloudKitHelper()
        ck.saveGunProperties(self)
        
        debugPrint("**************** Valor do atributo \(self.currentUpgradingGun) atualizado com sucesso *************" )
    }
}
