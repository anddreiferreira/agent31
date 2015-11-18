//
//  UpgradeLayer.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/17/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class UpgradeLayer: SKNode
{
    var upgradeName: SKLabelNode?
    var upgradeLevel: SKSpriteNode?
    var upgradeStars: SKSpriteNode?
    var animationArea: SKSpriteNode?
    var goldAvailableIcon: SKSpriteNode?
    var goldAvailableLabel: SKLabelNode?
    var upgradeGoldCost: SKLabelNode?
    var upgradeDuration: SKLabelNode?
    var upgradeButton: SKSpriteNode?
    
    override init() {
        super.init()
        loadLabels()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadLabels() {
        upgradeName = createLabelNode()
        goldAvailableLabel = createLabelNode()
        upgradeGoldCost = createLabelNode()
        upgradeDuration = createLabelNode()
    }
}
