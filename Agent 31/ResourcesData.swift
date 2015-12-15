//
//  ResourcesData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 02/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

private let _sharedInstance = ResourcesData()

class ResourcesData : NSObject {
    var gold: Int
    var metal: Int
    
    private override init() {
        gold = 0
        metal = 0
    }
    
    class var sharedInstance: ResourcesData {
        return _sharedInstance
    }
}