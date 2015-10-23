//
//  Enemy.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GeneralEnemy: Character {
    
    override init(legsImage: String, torsoImage: String, position: CGPoint, zPosition: CGFloat) {
        super.init(legsImage: legsImage, torsoImage: torsoImage, position: position, zPosition: zPosition)
        
        setGeneralAttributesForGeneralEnemy()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForGeneralEnemy(){
        
    }
}
