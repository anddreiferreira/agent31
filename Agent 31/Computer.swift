//
//  Computer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Computer: GameObject {

    var positionRecieved : CGPoint?
    
    override init(imageName: String = "placeHolderPC", position: CGPoint, scale : CGFloat = 0.5,  zPosition: CGFloat = 5.0){
        
        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func positionRequiredComputer() -> CGPoint{
        
        return self.position
        
    }
    
    
}
