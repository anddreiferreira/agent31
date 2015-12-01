//
//  ExceptionScene.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 01/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class ExceptionScene: SKScene, UIAlertViewDelegate {

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        debugPrint("MOSTRA ALERT PARA O USUARIO")
        
        let alertView: UIAlertView
        
        if( CloudKitExceptions.sharedInstance.resourcesDataException || CloudKitExceptions.sharedInstance.characterDataException ) {
            alertView = UIAlertView(title: "iCloud Error", message: "Cannot connect to iCloud", delegate: self, cancelButtonTitle: "OK")
        } else { // Internet exception
            alertView = UIAlertView(title: "Internet Error", message: "You're not connected to the internet", delegate: self, cancelButtonTitle: "OK" )
        }
        
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
       
        // If the game cannot connect to the internet or fetch data from cloudkit, it will close.
        if buttonIndex == 0 {
            exit(0)
        }
    }
}
