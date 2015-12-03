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
    var livesTimer: NSTimer?
    
    override init() {
        super.init()
        
        self.livesTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "verifyLivesTimer", userInfo: nil, repeats: true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "verifyLostLifeDate", name: "AgentLostOneLifeNotification", object: nil)
    }
    
    func verifyLostLifeDate() {
        
        saveLivesInCloudKit()
        
        if lostLifeDate == nil {
            lostLifeDate = NSDate()
        }
    }
    
    func saveLivesInCloudKit() {
        
        let ckhelper = CloudKitHelper()
        
        let character = CharacterData.sharedInstance
        
        ckhelper.saveCharacterProperties(character)
    }
    
    // This function verifies if the time to restore a life is reached
    func verifyLivesTimer() {
        
        if lostLifeDate != nil {
            let interval = NSDate().timeIntervalSinceDate(self.lostLifeDate!)
            let timeToRestoreALife = 15.0
            
            if interval >= timeToRestoreALife {
                agentWonALife()
            }
        }
    }
    
    func agentWonALife() {
        
        self.lostLifeDate = NSDate()
        print("HEY, YOU WON A LIFE")
        CharacterData.sharedInstance.restoreLife()
        
        let ckhelper = CloudKitHelper()
        ckhelper.saveCharacterProperties(CharacterData.sharedInstance)
        
        NSNotificationCenter.defaultCenter().postNotificationName("ReloadLifeBarNotification", object: nil)
    }
}
