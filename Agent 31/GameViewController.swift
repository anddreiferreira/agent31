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

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        let skView = self.view as! SKView
//        skView.showsFPS = true
//        skView.showsPhysics = true
//        skView.showsNodeCount = true
//        skView.ignoresSiblingOrder = true
//        
//        self.view.multipleTouchEnabled = true
//        
//        // The scene should be loaded like this so 
//        // it doesn't creates strong refereces
//        skView.presentScene(LaboratoryScene(size: CGSize(width: 667, height: 375)))
//        
//    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let skView = self.view as! SKView
        if skView.scene == nil {
            let scene = LaboratoryScene(size:skView.bounds.size)

            skView.ignoresSiblingOrder = true
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
    
    func changeScene(){
        let skView = self.view as! SKView
        
        let newScene = LaboratoryScene(size: skView.bounds.size)
        newScene.scaleMode = .AspectFill
        let oldScene = skView.scene;
        oldScene?.removeFromParent()
        skView.presentScene(newScene)
    }
}
