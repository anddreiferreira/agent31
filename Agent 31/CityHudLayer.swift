//
//  CityHudLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 22/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class CityHudLayer: SKNode {
  
    private var cityPauseButton : SKSpriteNode?
    private var cityLifeBar : SKSpriteNode?
    
    private var slotGold : SKSpriteNode?
    private var slotMetal : SKSpriteNode?
    private var slotDiamond : SKSpriteNode?
    
    private var goldIcon : SKSpriteNode?
    private var metaldIcon : SKSpriteNode?
    private var diamondIcon : SKSpriteNode?
    
    private var goldBar : SKSpriteNode?
    private var metaldBar : SKSpriteNode?
    private var diamondBar : SKSpriteNode?
    
    private var xpBar : SKSpriteNode?
    
    private var labelGoldAmount : SKLabelNode?
    private var labelMetalAmount : SKLabelNode?
    private var labelDiamondAmount : SKLabelNode?
    
    private var labelMaxGold : SKLabelNode?
    private var labelMaxMetal : SKLabelNode?
    private var labelMaxDiamond : SKLabelNode?
    
    override init(){
        
        super.init()
        
        self.loadPauseCity()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadPauseCity(){
    
        cityPauseButton = createSpriteNode("pauseCity", position: CGPointMake(11, 375-5), zPosition: 2, name: "pauseCity")
        self.addChild(cityPauseButton!)
    }
    
    
    // puting all nodes necessary
    func putHudLayerCity(){
        
    
    }
    
    
    func appearXpBar(){}
    
    func appearGoldBar(){}
    
    func appearMetalBar(){}
    
    func appearDiamonBar(){}


}
