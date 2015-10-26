//
//  CloudKitHelper.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 26/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitHelper {
    
    var container: CKContainer
    let privateDataBase: CKDatabase
    
    init() {
        container = CKContainer.defaultContainer()
        privateDataBase = container.privateCloudDatabase
    }
}

// MARK: CRUD to Character attributes
extension CloudKitHelper {
    
}

// MARK: CRUD to Guns' attributes
extension CloudKitHelper {
    
}

// MARK: CRUD to Resources' attributes
extension CloudKitHelper {
    
}
