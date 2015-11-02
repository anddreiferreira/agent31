//
//  GameData.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import UIKit

private let _sharedInstance = GameData()

class GameData: NSObject {

    var characterData = CharacterData()
    var resourcesData = ResourcesData()
    
    private override init() {
        
    }
    
    func hello() {
        print( "HELLO, I`m a Singleton instance" )
    }
    class var sharedInstance: GameData {
        return _sharedInstance
    }
    
    enum LabLayers {
        case DeskNumber
        case ComputerNumber
        case TelevisionNumber
        case TrainingCenterNumber
        case GunDevelopmentCenterNumber
    }
    
    enum CityLayers {
        case GameNumber
        case PauseNumber
    }
    
    
}
