//
//  Desk.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import UIKit

class Desk: GameObject {

    var positionReceived : CGPoint?
    
    init(imageName: String = "placeHolderMesa", position: CGPoint,  zPosition: CGFloat = 5.0){
        
        super.init(imageName: imageName, position: position, zPosition: zPosition)
        
        self.setDeskAttributes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    func positionRequiredDesk() -> CGPoint{
    
        return self.position
    
    }
    
    func setDeskAttributes(){
        self.setScale(0.5)
    }
    
    
    
}
