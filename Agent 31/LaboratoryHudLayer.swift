//
//  HudLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryHudLayer: SKNode {

    private var laboratoryHeaderSpriteResources : SKSpriteNode?

    private var laboratoryTimeLabel : SKLabelNode?
    
    private var timeRemainingLife : SKLabelNode?
    
    override init(){
        
        super.init()
        
        self.loadheader()
        self.loadLifeBar()
        self.loadGolds()
        self.loadMetals()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadLifeBarAndMessage", name: "ReloadLifeBarNotification", object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadheader(){
        
        // header
        let headerPosition = CGPointMake(-middleOfTheScreenPoint.x + 20, -middleOfTheScreenPoint.y + 366)
        let laboratoryHeaderSprite = createSpriteNode("headerBarLab", position: headerPosition, zPosition: 3, name: "headerBarLab")
        laboratoryHeaderSprite.alpha = 0.3
        
        self.addChild(laboratoryHeaderSprite)
        
    }
    
    func loadGolds(){
        // require from singleton golds avaiable
        let goldSprite = createSpriteNode("Coin", position: CGPointMake(-middleOfTheScreenPoint.x + 350, -middleOfTheScreenPoint.y + 335), anchorPoint: CGPointMake(0, 0), scale: 0.5, zPosition: 4, name: "Coin")
        
        let goldsAvaiable = ResourcesData.sharedInstance.gold
        let laboratoryGoldLabel = createLabelNode("\(goldsAvaiable)", zPosition: 4,position: CGPointMake(-middleOfTheScreenPoint.x + 380,-middleOfTheScreenPoint.y + 338),alignmentMode:SKLabelHorizontalAlignmentMode.Left, fontSize: 28,name: "laboratoryGoldLabel")
        
        self.addChild(goldSprite)
        self.addChild(laboratoryGoldLabel)
    }
    
    func loadMetals(){
        
        let metalSprite = createSpriteNode("Metal", position: CGPointMake(-middleOfTheScreenPoint.x + 500, -middleOfTheScreenPoint.y + 332), anchorPoint: CGPointMake(0, 0), scale: 0.5, zPosition: 4, name: "Metal")
        
        // require from singleton metals avaiable
        let metalsAvaiable = ResourcesData.sharedInstance.metal
        let laboratoryMetalLabel = createLabelNode("\(metalsAvaiable)", zPosition: 4, position: CGPointMake(-middleOfTheScreenPoint.x + 550, -middleOfTheScreenPoint.y + 338),alignmentMode: SKLabelHorizontalAlignmentMode.Left, fontSize: 28,name: "laboratoryGoldLabel")
        
        self.addChild(metalSprite)
        self.addChild(laboratoryMetalLabel)
    }
    
    func loadDiamonds(){
        // require from singleton diamonds avaiable
        let laboratoryDiamondLabel = createLabelNode("32", zPosition: 4, position: CGPointMake(-middleOfTheScreenPoint.x + 600, -middleOfTheScreenPoint.y + 338),alignmentMode: SKLabelHorizontalAlignmentMode.Left, fontSize: 28,name: "laboratoryGoldLabel")
        self.addChild(laboratoryDiamondLabel)
    }
    
    func loadLifeBar(){
    
        // Load quantity from SINGLETON
        // For now...
        let livesNumber : Int = CharacterData.sharedInstance.lives
        let livesPosition = CGPointMake(-middleOfTheScreenPoint.x + 37, -middleOfTheScreenPoint.y + 359)
        
        let laboratoryLifeBar = createSpriteNode("life\(livesNumber)", position: livesPosition, zPosition: 4, name: "laboratoryLifeBar")
        
        self.addChild(laboratoryLifeBar)
        
        loadMessageLifeBar()
        
    }
    
    func loadMessageLifeBar(){
    
        let number : Int = CharacterData.sharedInstance.lives
        
        if number == 5 {
            
            let messagePosition = CGPointMake(-middleOfTheScreenPoint.x + 95, -middleOfTheScreenPoint.y + 323)
            let messageRemainingLife = createLabelNode("ALL LIVES AVAIABLE", fontName: "Helvetica", position: messagePosition, fontSize: 10, zPosition: 4, name: "messageRaminingLife")
            self.addChild(messageRemainingLife)
        }
//        else{
//        
//            messageRaminingLife = createLabelNode("Time remaining for next life", position: CGPointMake(20, 300), fontName: "Helvetica",fontSize: 10, zPosition: 2, alignmentMode: SKLabelHorizontalAlignmentMode.Center, name: "messageRaminingLife")
//        
//        }
    
    }
    
    func reloadLifeBarAndMessage() {
        loadLifeBar()
        loadMessageLifeBar()
    }
    
    
}
