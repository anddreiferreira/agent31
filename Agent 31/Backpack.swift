//
//  Backpack.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import UIKit

class Backpack: GameObject {
    
   init(imageName: String = "placeHolderBackPack", position: CGPoint, zPosition: CGFloat = 5.0){
        
        super.init(imageName: imageName, position: position, zPosition: zPosition)
    
        self.setGeneralAttributesForBackpack()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setGeneralAttributesForBackpack(){
        self.setScale(0.5)
    }
}
