//
//  DuelModeSearch.swift
//  Agent 31
//
//  Created by Anddrei Artaxexes on 11/12/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import CloudKit

class DuelModeSearch
{
    let container: CKContainer
    let database: CKDatabase
    let backgroundQueue: NSOperationQueue
    let opponents: [CKRecord]
    
    init() {
        container = CKContainer.defaultContainer()
        database = container.publicCloudDatabase
        backgroundQueue = NSOperationQueue()
        opponents = []
    }
    
    func searchDueler(duelerXP: NSNumber, duelerResources: [Int]) {
        let predicate = NSPredicate(format: "level == %@", duelerXP)
        let query = CKQuery(recordType: "Character", predicate: predicate)
        database.performQuery(query, inZoneWithID: nil) {
            records, error in
            if error != nil {
                debugPrint(error!.localizedDescription)
            } else {
                let queue = NSOperationQueue.mainQueue()
                queue.addOperationWithBlock() {
                    //self.saveDueler(opponentID: records!.first!.recordID)
                    print("Opponent ID:\(records!.first!.recordID)")
                }
            }
        }
    }
    
    func saveDueler(opponentID opponentID: CKRecordID) {
        let opponentIDRecord = CKRecord(recordType: "Character")
        opponentIDRecord.setObject("2", forKey: "dueler")
        database.saveRecord(opponentIDRecord) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                debugPrint("opponentID saved with success!")
            }
        }
    }
}