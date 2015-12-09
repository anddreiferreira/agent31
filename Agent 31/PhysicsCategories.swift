//
//  PhysicsCategories.swift
//  Agent 31
//
//  Created by Julio Xavier on 22/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

enum ColliderType: UInt32 {
    case Agent = 0
    case Ground = 0b1
    case Bullet = 0b10
    case Enemy = 0b100
    case Coin = 0b1000
    case Metal = 0b10000
    case None = 0b1000000
}