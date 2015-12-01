//
//  GameViewController.swift
//  Agent 31
//
//  Created by Henrique Dutra on 22/09/15.
//  Copyright (c) 2015 Agent31. All rights reserved.
//

import UIKit
import SpriteKit


//extension SKNode {
//    class func unarchiveFromFile(file : String) -> SKNode? {
//        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
//            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
//            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
//            
//            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
//            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! LaboratoryScene
//            archiver.finishDecoding()
//            return scene
//        } else {
//            return nil
//        }
//    }
//}

@available(iOS 9.0, *)
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Testando o cloudkit
        
//        let ckhelper = CloudKitHelper()
//        ckhelper.saveCharacterProperties(90, speed: 323, shootingRange: 171, shootingPower: 97, backPack: 500, level: 300)
//        ckhelper.saveResourcesProperties(99, metal: 90, diamond: 80)
//        ckhelper.saveGunProperties("Kalashnikov", level: 7, price: 200, blocked: false, secret: false, time: 200)
//        ckhelper.saveGunProperties("AK47", level: 8, price: 100, blocked: false, secret: false, time: 200)
//        let character = CharacterData()
//        ckhelper.fetchCharacterProperties(character)
//        
//        let delay = 1.0
//        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
//        dispatch_after(time, dispatch_get_main_queue()) {
//            print("Character JUMP = \(character.jump)")
//            print("Character SPEED = \(character.speed)")
//            print("Character SHOOTINGRANGE = \(character.shootingRange)")
//            print("Character SHOOTINGPOWER = \(character.shootingPower)")
//            print("Character BACKPACK = \(character.backPack)")
//            print("Character LEVEL = \(character.level)")
//
//        }
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
                
        let skView = self.view as! SKView
       
        // If there is an exception, then the game will not be displayed, instead it will show an exception scene
        let exceptionLaunched = CloudKitExceptions.sharedInstance.characterDataException || CloudKitExceptions.sharedInstance.resourcesDataException || CloudKitExceptions.sharedInstance.internetException
        if(exceptionLaunched) {
            let scene = ExceptionScene()
            
            skView.presentScene(scene)
        }

        if skView.scene == nil {
            let scene = LaboratoryScene(size:skView.bounds.size)

            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsPhysics = true
            skView.showsNodeCount = true
            scene.scaleMode = .AspectFill
            self.view.multipleTouchEnabled = true
            skView.presentScene(scene)
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return UIInterfaceOrientationMask.AllButUpsideDown
        } else {
            return UIInterfaceOrientationMask.All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidDisappear(animated: Bool) {
        
    }

}
