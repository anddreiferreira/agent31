//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {

    var testCharacter: Character?
    var agent31Lab : Agent? 
    private var analogStick : AnalogStick?
    var placeHolder : SKSpriteNode?

    private var jumpButtonLab : SKSpriteNode?
    private var goToCity : SKSpriteNode?
    
    var desk : Desk?
    var computer : Computer?
    var gunDevelopmentCenter : GunDevelopmentCenter?
    var television : Television?
    var trainingCenter : TrainingCenter?
    
    var tapObjectButton : SKSpriteNode?
// analog
    
    let kAnalogStickdiameter: CGFloat = 110
    let jSizePlusSpriteNode = SKSpriteNode(imageNamed: "analogBtn"), jSizeMinusSpriteNode = SKSpriteNode(imageNamed: "analogBg")
    private var _isSetJoystickStickImage = true, _isSetJoystickSubstrateImage = true
    
    let setJoystickStickImageBtn = SKLabelNode()
    let setJoystickSubstrateImageBtn = SKLabelNode()
    
    override init(){
        
        super.init()
        
        self.loadButtons()
        self.configureAnalogStick()
        self.putObjectPlaceHolder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadButtons(){
    
        jumpButtonLab = createSpriteNode("jumpButton", position: CGPointMake(537, 375-274), zPosition: 2, name: "jumpButtonLab")
        
        goToCity = createSpriteNode("cityButtonPlaceHolder", position: CGPointMake(598, 375-212), zPosition: 2, name: "goToCity")

    }
    
    private func putObjectPlaceHolder(){

        desk = Desk(position: CGPointMake(100, 220))
        computer = Computer(position: CGPointMake(-100, 220))
        television = Television(position: CGPointMake(-200, 220))
        trainingCenter = TrainingCenter(position: CGPointMake(-300, 220))
        gunDevelopmentCenter = GunDevelopmentCenter(position: CGPointMake(-400, 220))

    }
    
    func putGameLayer(){
        
        putGround()
//        putTestCharacter()
        putAgent()

        // Buttons
        self.addChild(jumpButtonLab!)
        self.addChild(goToCity!)
        
        // Objetcs
        self.addChild(desk!)
        self.addChild(computer!)
        self.addChild(television!)
        self.addChild(gunDevelopmentCenter!)
        self.addChild(trainingCenter!)
        
    }
    
    
    
    func putGround(){
        let ground = GameObject(imageName: "Ground", position: CGPointMake(667/2, 0), zPosition: 1)
        ground.physicsBody?.categoryBitMask = ColliderType.Ground.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Agent.rawValue
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.affectedByGravity = false
        self.addChild(ground)
    }
    
    func putAgent(){
        agent31Lab = Agent()
        self.addChild(agent31Lab!)
    }
    
    func putTestCharacter(){
        //        self.testCharacter = Character(imageName: "pernasParado1")
        self.addChild(self.testCharacter!)
    }
    
    // outer image
    private var isSetJoystickStickImage: Bool {
            
        get { return _isSetJoystickStickImage }
            
        set {
                
            _isSetJoystickStickImage = newValue
            let image = newValue ? UIImage(named: "analogBtn") : nil
            analogStick!.stickImage = image
            setJoystickStickImageBtn.text = newValue ? "Remove Stick Images" : "Set Stick Images"
        }
    }
    
    // inner image
    private var isSetJoystickSubstrateImage: Bool {
            
        get { return _isSetJoystickSubstrateImage }
            
        set {
                
            _isSetJoystickSubstrateImage = newValue
            let image = newValue ? UIImage(named: "analogBg") : nil
            analogStick!.substrateImage = image
            setJoystickSubstrateImageBtn.text = newValue ? "Remove Substrate Images" : "Set Substrate Images"
        }
    }
    
    // diamater of the analog stick
    private var joysticksdiameters: CGFloat {
            
        get { return max(analogStick!.diameter, analogStick!.diameter) }
            
        set(newdiameter) {
                
            analogStick!.diameter = newdiameter
        }
    }
        
    private func configureAnalogStick(){
        
        // initate an analog stick
        analogStick = AnalogStick(diameter: kAnalogStickdiameter, substrateImage:  UIImage(named: "analogBg"), stickImage: UIImage(named: "analogBtn"))
        
        let jRadius = kAnalogStickdiameter / 2
        
        // setting analog stick's properties
        analogStick!.diameter = kAnalogStickdiameter
        analogStick!.position = CGPointMake(jRadius + 15, jRadius + 15)
        analogStick!.trackingHandler = { analogStick in
        
        // fixating the agent's position to the analog
            
//        guard let aN = self.agent31Lab else { return }
        
        let xvelocity = analogStick.data.velocity.x
        self.agent31Lab!.move(xvelocity)
//        self.agent31Lab!.position = CGPointMake(aN.position.x + (analogStick.data.velocity.x * 0.12), aN.position.y)
        

        }
        
        addChild(analogStick!)
        
        // setting it's visual properties
        isSetJoystickStickImage = _isSetJoystickStickImage
        isSetJoystickSubstrateImage = _isSetJoystickSubstrateImage
        
    }
    
    func putDeskLayer(){
    
        
        
    }
    
    func messageTapObjectButton(number : Int){

        let pos : CGPoint = CGPointMake((self.desk?.position.x)!, (self.desk?.position.y)!+60)
        
        tapObjectButton = createSpriteNode("tapHereButton",position: pos , zPosition : 10, scale: 1.0, name: "tapHereButton")
        
        self.addChild(tapObjectButton!)
        nodeLighting(tapObjectButton!)
    
    }
   
    func removeTapObjectButton(){
    
        tapObjectButton?.removeFromParent()
        
    }
    
        
}
