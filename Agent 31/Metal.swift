//
//  Metal.swift
//  Agent 31
//
//  Created by Julio Xavier on 23/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Metal: GameObject {
    
    var value: Int
    
    init(position: CGPoint, zPosition: CGFloat = 10.0){
        
        // Randomize a value between 10 and 1
        self.value = Int(arc4random() % 10 + 1)
        
        super.init(imageName: "Metal", position: position, zPosition: zPosition)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
