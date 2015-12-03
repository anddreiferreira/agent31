//
//  CharacterLivesManager.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 03/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

class CharacterLivesManager {
    
    var lostLifeDate: NSDate?
    
    init() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "verifyLives", name: "AgentLostOneLifeNotification", object: nil)
    }
    
    func verifyLives() {
        
        if lostLifeDate == nil {
            lostLifeDate = NSDate()
        }
    }
}
