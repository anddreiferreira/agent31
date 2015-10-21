//
//  LaboratoryScene.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryScene: SKScene {

    private var laboratoryBackgroundLayer : LaboratoryBackgroundLayer!
    private var laboratoryHudLayer : LaboratoryHudLayer!
    
    
    override func didMoveToView(view: SKView) {
        
        print("laboratory scene entered")
        
        self.putBackgroundLayer()
        self.putHudLayer()
        

    }
    

    func putBackgroundLayer(){
        
        self.laboratoryBackgroundLayer = LaboratoryBackgroundLayer()
        self.laboratoryBackgroundLayer.putBackground()
        self.addChild(laboratoryBackgroundLayer)
    
    }

    func putHudLayer(){
        
        self.laboratoryHudLayer = LaboratoryHudLayer()
        self.laboratoryHudLayer.putHudLayer()
        self.addChild(laboratoryHudLayer)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
    }

}
