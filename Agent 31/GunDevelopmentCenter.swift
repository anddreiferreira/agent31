//
//  GunDevelopmentCenter.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class GunDevelopmentCenter: GameObject {

    var positionReceived : CGPoint?
    
    init(imageName: String = "placeHolderMesaArmas", position: CGPoint, zPosition: CGFloat = 5.0){
        
        super.init(imageName: imageName, position: position, zPosition: zPosition)
        
        self.setGunDevelopmentAttributes()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func positionRequiredGun() -> CGPoint{
        
        return self.position
        
    }
    
    func setGunDevelopmentAttributes(){
        self.setScale(0.5)
    }
    
    
}