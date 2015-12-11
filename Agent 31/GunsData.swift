//
//  GunData.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 12/1/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

enum Guns: String {
    case gun1Name = "CA115"
    case gun2Name = "XX103"
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
    
    var isUpgradingNow: Bool
    var currentUpgradingGun: String
    var finishTrainingDate: NSDate
    var timeLevelUp: NSTimeInterval
    
    private override init() {
        gun1Level = 0
        gun1Name = ""
        gun1Blocked = 0
        gun1 = ""
        gun2Level = 0
        gun2Name = ""
        gun2Blocked = 0
        gun2 = ""
        isUpgradingNow = false
        currentUpgradingGun = ""
        finishTrainingDate = nilDateValue()
        timeLevelUp = 0
    }
    
    class var sharedInstance: GunsData {
        return _sharedInstance
    }
}

extension GunsData {
    
    func getGunLevel(gunName: String) -> Int {
        if(gunName == Guns.gun1Name.rawValue) {
            return gun1Level
        } else if (gunName == Guns.gun2Name.rawValue) {
            return gun2Level
        }
        return 0
    }
    
    func setGunLevel(gunName: String, value: Int) {
        if(gunName == Guns.gun1Name.rawValue) {
            gun1Level = value
        } else if (gunName == Guns.gun2Name.rawValue) {
            gun2Level = value
        }
    }
    
    func initUpgrading(gunName: String) {
        // Current gun level
        let currentValue = getGunLevel(gunName)
        // Time and cost for upgrade
        let tuple = gunLeveUp(gunName, currentGunLevel: currentValue)
        // Verify resources for upgrade
        let verify = verifyResources(tuple.resourceLevelUp)
        if verify == false {
            return
        }
        // Discount the value of the upgrade
        ResourcesData.sharedInstance.metal -= tuple.resourceLevelUp
        // Inform to reload the amount of metal
        NSNotificationCenter.defaultCenter().postNotificationName("ReloadMetalNotification", object: nil)
        // Upgrade the gun level
        currentUpgradingGun = gunName
        isUpgradingNow = true
        finishTrainingDate = NSDate().dateByAddingTimeInterval(tuple.timeLevelUp)
        // Init timer
        initTimer(tuple.timeLevelUp)
        timeLevelUp = tuple.timeLevelUp
        // Save the current upgrade
        let ckhelper = CloudKitHelper()
        ckhelper.saveGunsProperties(self)
        ckhelper.saveResourcesProperties(ResourcesData.sharedInstance)
        // Schedule notification
        scheduleNotification(tuple.timeLevelUp, itemName: gunName, itemLevel: getGunLevel(gunName))
    }
    
    private func verifyResources(neededResources: Int) -> Bool {
        return ResourcesData.sharedInstance.metal >= neededResources ? true : false
    }
    
    private func initTimer(time: NSTimeInterval) {
        debugPrint("TEMPO RESTANTE DE UPGRADE \(time)")
        debugPrint("Inicializando o Timer do atributo \(currentUpgradingGun)")
        NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "finishUpgrading:", userInfo: self, repeats: false)
    }
    
    func reloadUpgradingTimer() {
        let remainingTime = NSDate().timeIntervalSinceDate(finishTrainingDate)
        initTimer(remainingTime)
    }
    
    func finishUpgrading(timer: NSTimer) {
        timer.invalidate()
        isUpgradingNow = false
        finishTrainingDate = nilDateValue()
        // Increment attribute/level
        setGunLevel(currentUpgradingGun, value: getGunLevel(currentUpgradingGun) + 1)
        currentUpgradingGun = "nil"
        // Saves the new level
        let ck = CloudKitHelper()
        ck.saveGunsProperties(self)
        debugPrint("Upgrade de \(currentUpgradingGun) para o nível \(getGunLevel(currentUpgradingGun)) concluído")
    }
 
}