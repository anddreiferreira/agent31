//
//  CharacterData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 28/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

class CharacterData {
    
    var jump: Int
    var speed: Int
    var shootingPower: Int
    var shootingRange: Int
    var backPack: Int
    var level: Int
    
    init() {
        self.jump = -1
        self.speed = -1
        self.shootingRange = -1
        self.shootingPower = -1
        self.backPack = -1
        self.level = -1
    }
    
    class func printCharacter( character: CharacterData ) {
        print( "Jump = \(character.jump)" )
        print( "Speed = \(character.speed)" )
        print( "Shooting range = \(character.shootingRange)" )
        print( "Shooting power = \(character.shootingPower)" )
        print( "Back pack = \(character.backPack)" )
        print( "Level = \(character.level)" )
    }
}