//
//  HudLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryHudLayer: SKNode {

    var points : Int
    let positionHudLayer : CGPoint
    
//    override init(){
//    
//        points = 2;
//        
//        super.init()
//    }
//    
//    override initWithPosition(CGPoint: point){
//    
//        super.init()
//
//    }

    init(positionRec: CGPoint, pointsRec: Int = 0){
        
        self.points = pointsRec
        self.positionHudLayer = positionRec
        
        super.init()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
}
