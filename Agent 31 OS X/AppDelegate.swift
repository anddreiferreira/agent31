//
//  AppDelegate.swift
//  Agent 31 OS X
//
//  Created by Anddrei Artaxexes on 10/28/15.
//  Copyright (c) 2015 Agent31. All rights reserved.
//


import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        
        // Check for internet connection availability
        let status = Reach().connectionStatus()
        switch status {
        case .Unknown, .Offline:
            debugPrint("Offline, do not load the game")
        case .Online:
            debugPrint("Online, load the game")
        }
        
        /* Pick a size for the scene */
        if let scene = GameScene(fileNamed:"GameScene") {
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            self.skView!.presentScene(scene)
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            self.skView!.ignoresSiblingOrder = true
            
            self.skView!.showsFPS = true
            self.skView!.showsNodeCount = true
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}
