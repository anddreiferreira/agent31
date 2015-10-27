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
    
//    var currentCharacterRecord: CKRecord!
    let characterRecordId = CKRecordID(recordName: "CharacterRec")
    
    init() {
        container = CKContainer.defaultContainer()
        privateDataBase = container.privateCloudDatabase
//        currentCharacterRecord = CKRecord(recordType: "Character", recordID: CKRecordID(recordName: "CharacterRec"))
    }
}

// MARK: CRUD to Character attributes
extension CloudKitHelper {
    
    func saveCharacterProperties( jump: Int, speed: Int, shootingRange: Int, shootingPower: Int, backPack: Int, level: Int )
    {
        
        self.privateDataBase.fetchRecordWithID( self.characterRecordId, completionHandler: ({
            fetchedRecord, error in
            
            if let err = error {
                print( "Fetch Error" )
                print( err.description )
                self.createRecord( jump, speed: speed, shootingRange: shootingRange, shootingPower: shootingPower, backPack: backPack, level: level )
            } else {
                fetchedRecord?.setValue( jump, forKey: "Jump" )
                fetchedRecord?.setValue( speed, forKey: "Speed" )
                fetchedRecord?.setValue( shootingRange, forKey: "ShootingRange" )
                fetchedRecord?.setValue( shootingPower, forKey: "ShootingPower" )
                fetchedRecord?.setValue( backPack, forKey: "BackPack" )
                fetchedRecord?.setValue( level, forKey: "Level" )
                
                self.privateDataBase.saveRecord( fetchedRecord!, completionHandler: ({
                    savedRecord, sError in
                    
                    if let sErr = sError {
                        print( "Save Error" )
                        print( sErr.description )
                    } else {
                        print( "Save successful" )
                    }
                }))
            }
            
        }))
    }
    
    private func createRecord( jump: Int, speed: Int, shootingRange: Int, shootingPower: Int, backPack: Int, level: Int ) {
        
        let newRecord = CKRecord( recordType: "Character", recordID: self.characterRecordId )
        newRecord.setValue( jump, forKey: "Jump" )
        newRecord.setValue( speed, forKey: "Speed" )
        newRecord.setValue( shootingRange, forKey: "ShootingRange" )
        newRecord.setValue( shootingPower, forKey: "ShootingPower" )
        newRecord.setValue( backPack, forKey: "BackPack" )
        newRecord.setValue( level, forKey: "Level" )
        
        self.privateDataBase.saveRecord( newRecord, completionHandler: ({
            savedRecord, error in
            if let err = error {
                print( "Save Error" )
                print( err.description )
            } else {
                print( "Save successful" )
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
