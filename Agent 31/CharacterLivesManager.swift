//
//  CharacterLivesManager.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 03/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

class CharacterLivesManager: NSObject {
    
    var lostLifeDate: NSDate?
    var restoreLifeDate: NSDate?
    var livesTimer: NSTimer?
    
    let timeToRestoreALife = 45.0
    
    override init() {
        super.init()
        
        self.livesTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "verifyLivesTimer", userInfo: nil, repeats: true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "verifyLostLifeDate", name: "AgentLostOneLifeNotification", object: nil)
    }
    
    func verifyLostLifeDate() {
        
        // This updates the lives in the cloudkit - this will save the new number of lives
        saveLivesInCloudKit()
        
        // This will get the datetime to begin regenerate lives, if all lives are available, then lostLifeDate and restoreLifeDate should be nil
        if lostLifeDate == nil {
            lostLifeDate = NSDate()
            restoreLifeDate = lostLifeDate?.dateByAddingTimeInterval(self.timeToRestoreALife)
        }
    }
    
    func saveLivesInCloudKit() {
        
        let ckhelper = CloudKitHelper()
        
        let character = CharacterData.sharedInstance
        
        ckhelper.saveCharacterProperties(character)
    }
    
    // This function verifies if the time to restore a life is reached
    func verifyLivesTimer() {
        
        if restoreLifeDate != nil {
            let now = NSDate()
            let remainingTime = restoreLifeDate?.timeIntervalSinceDate(now)
            
            if remainingTime <= 0 {
                agentWonALife()
            }
        }
    }
    
    func agentWonALife() {
        
        // Update the datetimes to restore a life
        self.lostLifeDate = self.restoreLifeDate
        self.restoreLifeDate = self.restoreLifeDate?.dateByAddingTimeInterval(self.timeToRestoreALife)
        
        CharacterData.sharedInstance.restoreLife()
        
        // if there is no life to regenerate, there is no need to have a lostLifeDate and a restoreLifeDate
        if( CharacterData.sharedInstance.lives == 5 ) {
            self.lostLifeDate = nil
            self.restoreLifeDate = nil
            
            // Update these values in the database
        }
        
        let ckhelper = CloudKitHelper()
        ckhelper.saveCharacterProperties(CharacterData.sharedInstance)
        
        NSNotificationCenter.defaultCenter().postNotificationName("ReloadLifeBarNotification", object: nil)
    }
}
