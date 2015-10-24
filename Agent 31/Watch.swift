//
//  Watch.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import UIKit

class Watch: GameObject {
    
   override init(imageName: String = "placeHolderTreinamento", position: CGPoint, scale : CGFloat = 0.5,  zPosition: CGFloat = 5.0, nameP name : String = ""){
    
        super.init(imageName: imageName, position: position, scale: scale, zPosition: zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForWatch(){
        
    }

}
