//
//  GunData.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 12/1/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

enum Guns: String {
    case gun1Name = "AK47"
    case gun2Name = "AK48"
}

private let _sharedInstance = GunsData()

class GunsData: NSObject {
    
    var gun1: String
    var gun1Level: Int
    var gun1Name: String
    var gun1Blocked: Int
    var gun2: String
    var gun2Level: Int
    var gun2Name: String
    var gun2Blocked: Int
    var timeLevelUp = NSTimeInterval()
    var isUpgradingNow = false
    private var currentUpgradingGun = ""
    
    private override init() {
        self.gun1Level = 0
        self.gun1Name = ""
        self.gun1Blocked = 0
        self.gun1 = ""
        self.gun2Level = 0
        self.gun2Name = ""
        self.gun2Blocked = 0
        self.gun2 = ""
    }
    
    class var sharedInstance: GunsData {
        return _sharedInstance
    }
}

extension GunsData {
    
    func getGunLevel(gunName: String) -> Int {
        if(gunName == Guns.gun1Name.rawValue) {
            return self.gun1Level
        } else if (gunName == Guns.gun2Name.rawValue) {
            return self.gun2Level
        } else {
            return 0
        }
    }
    
    func setGunLevel(gunName: String, value: Int) {
        if(gunName == Guns.gun1Name.rawValue) {
            self.gun1Level = value
        } else if (gunName == Guns.gun2Name.rawValue) {
            self.gun2Level = value
        } else {
            // Do nothing
        }
    }
    
    func initUpgrading(gunName: String) {
        
        debugPrint("Inicializando o upgrade da arma \(gunName)")
        let currentValue = self.getGunLevel(gunName)
        
        self.currentUpgradingGun = gunName
        isUpgradingNow = true
        
        // Time and cost for upgrade
        let tuple = gunLeveUp(gunName, currentGunLevel: currentValue)
        // Init timer
        self.initTimer(tuple.timeLevelUp, value: currentValue)
        // Schedule notification
        scheduleNotification(tuple.timeLevelUp, itemName: gunName, itemLevel: self.getGunLevel(gunName))
    }
    
    private func initTimer(time: NSTimeInterval, value: Int) {
        debugPrint("Inicializando o timer da arma \(self.currentUpgradingGun)")
        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishUpgrading:", userInfo: self, repeats: false)
    }
    
    func finishUpgrading(timer: NSTimer) {
        
        timer.invalidate()
        
        isUpgradingNow = false
        
        // Increment attribute/level
        let attrValue = self.getGunLevel(self.currentUpgradingGun)
        self.setGunLevel(self.currentUpgradingGun, value: attrValue + 1)
        debugPrint("Upgrade de \(self.currentUpgradingGun) para o nível \(self.getGunLevel(self.currentUpgradingGun)) concluído")
        // Saves the new level
        //let ck = CloudKitHelper()
        //ck.saveGunsProperties(self)
    }
 
}