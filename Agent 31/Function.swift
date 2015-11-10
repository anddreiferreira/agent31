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

func gunLeveUp(gunName: String, currentGunLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    let nextGunLevel = currentGunLevel + 1
    switch gunName {
        case "gun1":
            return (Double(nextGunLevel) * minutesToSeconds(5), nextGunLevel * Int(pow(balanceGunResource, 1.0)))
        case "gun2":
            return (Double(nextGunLevel) * minutesToSeconds(10), nextGunLevel * Int(pow(balanceGunResource, 2.0)))
        case "gun3":
            return (Double(nextGunLevel) * minutesToSeconds(20), nextGunLevel * Int(pow(balanceGunResource, 3.0)))
        case "gun4", "gun5":
            return (Double(nextGunLevel) * minutesToSeconds(30), nextGunLevel * Int(pow(balanceGunResource, 4.0)))
        case "gun6", "gun7":
            return (Double(nextGunLevel) * minutesToSeconds(40), nextGunLevel * Int(pow(balanceGunResource, 5.0)))
        case "gun8", "gun9", "gun10":
            return (Double(nextGunLevel) * minutesToSeconds(50), nextGunLevel * Int(pow(balanceGunResource, 6.0)))
        case "gun11", "gun12":
            return (Double(nextGunLevel) * minutesToSeconds(60), nextGunLevel * Int(pow(balanceGunResource, 7.0)))
        case "gun13", "gun14":
            return (Double(nextGunLevel) * minutesToSeconds(70), nextGunLevel * Int(pow(balanceGunResource, 8.0)))
        case "gun15":
            return (Double(nextGunLevel) * minutesToSeconds(80), nextGunLevel * Int(pow(balanceGunResource, 9.0)))
        default:
            return (0.00, 0)
    }
}

// MARK: Character
let balanceCharacterResource = 10.0

func characterLevelUp(attributeName: String, currentAttributeLevel: Int) -> (timeLevelUp: NSTimeInterval, resourceLevelUp: Int)
{
    let nextAttributeLevel = currentAttributeLevel + 1
    return (Double(nextAttributeLevel) * minutesToSeconds(30), nextAttributeLevel * Int(pow(balanceCharacterResource, 3.0)))
}

// MARK: Gems
let balanceGemTime = 20.0

func gemLevelUp() -> Int
{
    return 0
}