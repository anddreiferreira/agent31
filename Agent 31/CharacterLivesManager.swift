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
    
    override init() {
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "verifyLives", name: "AgentLostOneLifeNotification", object: nil)
    }
    
    func verifyLives() {
        
        saveLifesInCloudKit()
        
        if lostLifeDate == nil {
            lostLifeDate = NSDate()
        }
    }
    
    func saveLifesInCloudKit() {
        
        let ckhelper = CloudKitHelper()
        
        let character = CharacterData.sharedInstance
        
        ckhelper.saveCharacterProperties(character)
    }
}
