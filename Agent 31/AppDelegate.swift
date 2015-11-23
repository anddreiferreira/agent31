//
//  AppDelegate.swift
//  Agent 31
//
//  Created by Henrique Dutra on 22/09/15.
//  Copyright (c) 2015 Agent31. All rights reserved.
//

import UIKit
//import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let ckhelper = CloudKitHelper()
    var characterDataOn = false
    var resourcesDataOn = false
    var character = CharacterData.sharedInstance
    var resources = ResourcesData.sharedInstance

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // Setting up notifications for user
        let notificationTypes: UIUserNotificationType = [.Alert, .Badge, .Badge]
        let notificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        
        // Check for internet connection availability
        let status = Reach().connectionStatus()
        switch status {
        case .Unknown, .Offline:
            debugPrint("Offline, do not load the game")
        case .Online:
            debugPrint("Online, load the game")
        }
        
        // CloudKit account status
        /*
        CKContainer.defaultContainer().accountStatusWithCompletionHandler({
            accountStatus, error in
            if accountStatus == CKAccountStatus.NoAccount {
                //Present alert
            }
        })
        */
        
        // Override point for customization after application launch.
        
        ckhelper.fetchCharacterProperties(character)
        ckhelper.fetchResourcesProperties(resources)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "turnOnCharacterData", name: "characterDataNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "turnOnResourcesData", name: "resourcesDataNotification", object: nil)
        while( self.characterDataOn == false || self.resourcesDataOn == false ) {
//             print("Wait") // -> vai ficar na tela de loading enquanto nao carregar os dados do cloudkit
        }
//        self.character.initTraining("BackPack")
        debugPrint( "Qtd de diamantes = \(ResourcesData.sharedInstance.metal)" )

        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification)
    {
        debugPrint("Notification in background received")
    }    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


// MARK: Notifications actions
extension AppDelegate {
    
    func turnOnCharacterData() {
        CharacterData.sharedInstance.jump = self.character.jump
        CharacterData.sharedInstance.speed = self.character.speed
        CharacterData.sharedInstance.shootingPower = self.character.shootingPower
        CharacterData.sharedInstance.shootingRange = self.character.shootingRange
        CharacterData.sharedInstance.backPack = self.character.backPack
        CharacterData.sharedInstance.level = self.character.level
        
        self.characterDataOn = true
    }
    
    func turnOnResourcesData() {
        
        ResourcesData.sharedInstance.metal = self.resources.metal
        ResourcesData.sharedInstance.gold = self.resources.gold
        ResourcesData.sharedInstance.diamond = self.resources.diamond
        
        self.resourcesDataOn = true
    }
}
