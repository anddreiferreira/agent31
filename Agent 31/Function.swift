//
//  Function.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/6/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation


func minutesToSeconds(min: Int) -> Double
{
    return Double(min) * 60.0
}

// MARK: Gun
let balanceGunResource = 5.0

func gunLeveUp(gunName: String, var currentGunLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    ++currentGunLevel
    switch gunName {
        case GunsData.sharedInstance.gun1Name:
            return (minutesToSeconds(1), currentGunLevel * Int(pow(balanceGunResource, 1.0))) /* Retorno de teste */
            //return (Double(currentGunLevel) * minutesToSeconds(5), currentGunLevel * Int(pow(balanceGunResource, 1.0)))
        case GunsData.sharedInstance.gun2Name:
            return (Double(currentGunLevel) * minutesToSeconds(10), currentGunLevel * Int(pow(balanceGunResource, 2.0)))
        case "gun3":
            return (Double(currentGunLevel) * minutesToSeconds(20), currentGunLevel * Int(pow(balanceGunResource, 3.0)))
        case "gun4", "gun5":
            return (Double(currentGunLevel) * minutesToSeconds(30), currentGunLevel * Int(pow(balanceGunResource, 4.0)))
        case "gun6", "gun7":
            return (Double(currentGunLevel) * minutesToSeconds(40), currentGunLevel * Int(pow(balanceGunResource, 5.0)))
        case "gun8", "gun9", "gun10":
            return (Double(currentGunLevel) * minutesToSeconds(50), currentGunLevel * Int(pow(balanceGunResource, 6.0)))
        case "gun11", "gun12":
            return (Double(currentGunLevel) * minutesToSeconds(60), currentGunLevel * Int(pow(balanceGunResource, 7.0)))
        case "gun13", "gun14":
            return (Double(currentGunLevel) * minutesToSeconds(70), currentGunLevel * Int(pow(balanceGunResource, 8.0)))
        case "gun15":
            return (Double(currentGunLevel) * minutesToSeconds(80), currentGunLevel * Int(pow(balanceGunResource, 9.0)))
        default:
            return (0.00, 0)
    }
}

// MARK: Character
let balanceCharacterResource = 10.0

func characterLevelUp(attributeName: String, var currentAttributeLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    ++currentAttributeLevel
    return (Double(currentAttributeLevel) * minutesToSeconds(30), currentAttributeLevel * Int(pow(balanceCharacterResource, 3.0)))
}

// MARK: Gems
let balanceGemTime = 20.0

func gemLevelUp() -> Int
{
    return 0
}