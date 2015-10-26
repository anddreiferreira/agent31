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
//    Level Jump
//    Level Speed
//    Level Shooting Range
//    Level Shooting Power
//    Level backpack
//    Level geral
    func saveCharacterProperties( jump: Int, speed: Int, shootingRange: Int, shootingPower: Int, backPack: Int, level: Int )
    {
        let characterRec = CKRecord( recordType: "Character" )
        characterRec.setValue( jump, forKey: "Jump" )
        characterRec.setValue( speed, forKey: "Speed" )
        characterRec.setValue( shootingRange, forKey: "ShootingRange" )
        characterRec.setValue( shootingPower, forKey: "ShootingPower" )
        characterRec.setValue( backPack, forKey: "BackPack" )
        characterRec.setValue( level, forKey: "Level" )
        
        privateDataBase.saveRecord( characterRec, completionHandler: ({
            returnRecord, error in
            
            if let err = error {
                print( "Save Error" )
                print( err.description )
            } else {
                dispatch_async( dispatch_get_main_queue() ) {
                    print( "Success" )
                }
            }
            
        }))
    }
    
    func getCharacterRecord() { //should return a character

        let predicate = NSPredicate(value: true)
//        let sort = NSSortDescriptor(key: "Jump", ascending: false)
        
        let query = CKQuery(recordType: "Character", predicate: predicate)
//        query.sortDescriptors = [ sort ]
        
        privateDataBase.performQuery(query, inZoneWithID: nil, completionHandler: ({
            results, error in
            if error == nil {
                for r in results! {  // Should populate an object with the attributes
                    let jump = r["Jump"] as! Int
                    let speed = r["Speed"] as! Int
                    let sRange = r["ShootingRange"] as! Int
                    let sPower = r["ShootingPower"] as! Int
                    let bp = r["BackPack"] as! Int
                    let level = r["Level"] as! Int
                    
                    print( "Agent attributes are: Jump(\(jump)), Speed(\(speed)), ShootingRange(\(sRange)), ShootingPower(\(sPower)), BackPack(\(bp)), Level(\(level))")
                }
            } else {
                print("Query error")
            }
        }))
    }
}

// MARK: CRUD to Guns' attributes
extension CloudKitHelper {
//    Level
//    Tipo
//    Preço
//    Block ou unblocked
//    Secreto ou não
//    Tempo de desenvolvimento para próximo level

}

// MARK: CRUD to Resources' attributes
extension CloudKitHelper {
//    Quantidade de moedas
//    Quantidade de metal
//    Quantidade de diamante
}
