//
//  LaboratoryBackgroundLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryBackgroundLayer: SKNode {

    private var backgroundLaboratory : SKSpriteNode?

    func putBackground(){
    
        backgroundLaboratory = createSpriteNode("backgroundLabTest", anchorPoint: CGPointMake(0,0), zPosition: 0, position: CGPointMake(0, 0),name: "backgroundLab")
        self.addChild(backgroundLaboratory!)
        
    }
    

 

  
}
