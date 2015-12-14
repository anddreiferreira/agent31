//
//  GameViewController.swift
//  Agent 31
//
//  Created by Henrique Dutra on 22/09/15.
//  Copyright (c) 2015 Agent31. All rights reserved.
//

import UIKit
import SpriteKit


@available(iOS 9.0, *)
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()  
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
                
        let skView = self.view as! SKView
       
        if skView.scene == nil {
            let scene = LaboratoryScene(size:skView.bounds.size)

            skView.ignoresSiblingOrder = false
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
