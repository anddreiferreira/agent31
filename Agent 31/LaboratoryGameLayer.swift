//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {

    var agent31Lab : Agent? 
    var analogStick : AnalogStick?
    var placeHolder : SKSpriteNode?

    var jumpButtonLab : SKSpriteNode?
    var goToCity : SKSpriteNode?
    
    override init(){
        
        super.init()
        
        self.loadButtons()
//        self.configureAnalogStick()
        self.placeHolderPut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButtons(){
    
        jumpButtonLab = createSpriteNode("jumpButton", position: CGPointMake(537, 375-274), zPosition: 2, name: "jumpButtonLab")
        
        goToCity = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(598, 375-212), zPosition: 2, name: "goToCity")
    
    }
    
    func placeHolderPut(){

        placeHolder = createSpriteNode("placeHolderAgent", zPosition: 4, name: "placeHolderAgent")
    
    }
    
    func configureAnalogStick(){

        analogStick = AnalogStick(diameter: 100)
        analogStick!.position = CGPointMake(30, 30)
        analogStick!.trackingHandler = { analogStick in
            
            guard let aN = self.placeHolder else { return }
            
            aN.position = CGPointMake(aN.position.x + (analogStick.data.velocity.x * 0.12), aN.position.y + (analogStick.data.velocity.y * 0.12))
        }
        self.addChild(analogStick!)
    
    
    }
    
    func putGameLayer(){
        
        agent31Lab = Agent()
        self.addChild(agent31Lab!)
        self.addChild(jumpButtonLab!)
        self.addChild(goToCity!)
//        self.addChild(placeHolder!)
    }
    

    func buttonTapped(nodeTapped: SKNode){
    
        
//        nodeTapped.setScale(scale)
    
        let scale1 = SKAction.scaleTo(0.52, duration: 0.01)
        let scale2 = SKAction.scaleTo(0.54, duration: 0.01)
        let scale3 = SKAction.scaleTo(0.56, duration: 0.01)
        let scale4 = SKAction.scaleTo(0.50, duration: 0.01)
        
        let sequence = SKAction.sequence([scale1,scale2,scale3,scale2, scale1, scale4])
        
        nodeTapped.runAction(sequence)

    }
    
}
