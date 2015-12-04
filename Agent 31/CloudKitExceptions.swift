//
//  CloudKitExceptions.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 30/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

private let _sharedInstance = CloudKitExceptions()

class CloudKitExceptions : NSObject {
    var characterDataException: Bool
    var resourcesDataException: Bool
    var gunsDataException: Bool
    var internetException: Bool
    
    private override init() {
        characterDataException = false
        resourcesDataException = false
        gunsDataException = false
        internetException = false
    }
    
    class var sharedInstance: CloudKitExceptions {
        return _sharedInstance
    }
}