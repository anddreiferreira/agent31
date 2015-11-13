//
//  TrainingCenterLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 21/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class TrainingCenterLayer: SKNode
{
    var trainingCenter: SKSpriteNode?
    
    override init() {
        super.init()
        self.loadtrainingCenter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadtrainingCenter() {
        //trainingCenter = createSpriteNode()
        debugPrint("Load Training Center layer")
    }
    
    func putTrainingCenterLayer() {
        self.addChild(trainingCenter!)
    }
    
}