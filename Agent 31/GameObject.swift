//
//  GameObject.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GameObject: SKSpriteNode {

    init(position: CGPoint){
        let texture = SKTexture(imageNamed: "1")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.position = position
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func invertSpriteHorizontally(option: Bool) -> Void{
        if(option == true){
            self.xScale = -fabs(self.xScale)
        }else{
            self.xScale = fabs(self.xScale)
        }
    }

    
}
