//
//  Television.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Television: GameObject {

    var positionReceived : CGPoint?
    
    init(imageName: String = "placeHolderTV", position: CGPoint, zPosition: CGFloat = 5.0){
        
        
        super.init(imageName: imageName, position: position, zPosition: zPosition)
        
        setTelevisionAttributes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func positionRequiredTelevision() -> CGPoint{
        
        return self.position
        
    }
    
    func setTelevisionAttributes(){
        self.setScale(0.5)
    }
    
    
}
