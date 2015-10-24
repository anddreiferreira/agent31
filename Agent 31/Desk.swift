//
//  Desk.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import UIKit

class Desk: GameObject {

    var positionRecieved : CGPoint?
    
    override init(imageName: String = "placeHolderMesa", position: CGPoint, scale : CGFloat = 0.5,  zPosition: CGFloat = 5.0, nameP name : String = ""){
        
        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition, nameP: "deskPlaceholder")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    func positionRequiredDesk() -> CGPoint{
    
        return self.position
    
    }
    
    
    
}
