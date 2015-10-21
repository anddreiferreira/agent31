//
//  Agent.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Agent: Character {
    
    override init(imageName: String = "1", position: CGPoint = middleOfTheScreenPoint, scale: CGFloat = 0.5, zPosition: CGFloat = 1.0){
        
        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition)
        
        setGeneralAttributesForAgent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForAgent(){
    
    }
    
}
