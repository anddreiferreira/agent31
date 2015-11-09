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

func gunLeveUp(gunName: String, gunLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    switch gunName {
        case "gun1":
            return (Double(gunLevel) * minutesToSeconds(5), gunLevel * Int(pow(balanceGunResource, 1.0)))
        case "gun2":
            return (Double(gunLevel) * minutesToSeconds(10), gunLevel * Int(pow(balanceGunResource, 2.0)))
        case "gun3":
            return (Double(gunLevel) * minutesToSeconds(20), gunLevel * Int(pow(balanceGunResource, 3.0)))
        case "gun4", "gun5":
            return (Double(gunLevel) * minutesToSeconds(30), gunLevel * Int(pow(balanceGunResource, 4.0)))
        case "gun6", "gun7":
            return (Double(gunLevel) * minutesToSeconds(40), gunLevel * Int(pow(balanceGunResource, 5.0)))
        case "gun8", "gun9", "gun10":
            return (Double(gunLevel) * minutesToSeconds(50), gunLevel * Int(pow(balanceGunResource, 6.0)))
        case "gun11", "gun12":
            return (Double(gunLevel) * minutesToSeconds(60), gunLevel * Int(pow(balanceGunResource, 7.0)))
        case "gun13", "gun14":
            return (Double(gunLevel) * minutesToSeconds(70), gunLevel * Int(pow(balanceGunResource, 8.0)))
        case "gun15":
            return (Double(gunLevel) * minutesToSeconds(80), gunLevel * Int(pow(balanceGunResource, 9.0)))
        default:
            return (0.00, 0)
    }
}

// MARK: Character
let balanceCharacterResource = 10.0

func characterLevelUp(attributeName: String, attributeLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    return (Double(attributeLevel) * minutesToSeconds(30), attributeLevel * Int(pow(balanceCharacterResource, 3.0)))
}

// MARK: Gems
let balanceGemTime = 20.0

func gemLevelUp() -> Int
{
    return 0
}