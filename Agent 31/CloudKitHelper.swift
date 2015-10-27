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
    
    let characterRecordId = CKRecordID(recordName: "CharacterRec")
    let resourcesRecordId = CKRecordID(recordName: "ResourcesRec")
    
    init() {
        container = CKContainer.defaultContainer()
        privateDataBase = container.privateCloudDatabase
    }
}

// MARK: CRUD to Character attributes
extension CloudKitHelper {
    
    func saveCharacterProperties( jump: Int, speed: Int, shootingRange: Int, shootingPower: Int, backPack: Int, level: Int )
    {
        
        self.privateDataBase.fetchRecordWithID( self.characterRecordId, completionHandler: ({
            fetchedRecord, error in
            
            if let _ = error {
                self.createCharacterRecord( jump, speed: speed, shootingRange: shootingRange, shootingPower: shootingPower, backPack: backPack, level: level )
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
                        print( "Save Error - method saveCharacterProperties in CloudKitHelper" ) //Fazer o tratamento adequado
                        print( sErr.description )
                    } else {
                        print( "Character record updated successful" )
                    }
                }))
            }
            
        }))
    }
    
    private func createCharacterRecord( jump: Int, speed: Int, shootingRange: Int, shootingPower: Int, backPack: Int, level: Int ) {
        
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
                print( "Save Error - method createCharacterRecord in CloudKitHelper" ) // Fazer tratamento adequado
                print( err.description )
            } else {
                print( "Save character record successful" )
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
    
    func saveResourcesProperties ( gold: Int, metal: Int, diamond: Int ) {
        
        self.privateDataBase.fetchRecordWithID( self.resourcesRecordId, completionHandler: ({
            fetchedRecord, error in
            if let _ = error {
                self.createResourcesRecord( gold, metal: metal, diamond: diamond )
            } else {
                fetchedRecord?.setValue(metal, forKey: "Metal")
                fetchedRecord?.setValue(gold, forKey: "Gold")
                fetchedRecord?.setValue(diamond, forKey: "Diamond")
                
                self.privateDataBase.saveRecord( fetchedRecord!, completionHandler: ({
                    savedRec, error in
                    if let err = error {
                        print( "Save error - method saveResourcesProperties in CloudKitHelper" ) // Fazer tratamento adequado
                        print( err.description )
                    } else {
                        print( "Resources updated successful" )
                    }
                }))
            }
        }))
    }
    
    private func createResourcesRecord( gold: Int, metal: Int, diamond: Int ) {
        let resourcesRec = CKRecord( recordType: "Resources", recordID: self.resourcesRecordId )
        
        resourcesRec.setValue(metal, forKey: "Metal")
        resourcesRec.setValue(gold, forKey: "Gold")
        resourcesRec.setValue(diamond, forKey: "Diamond")
        
        self.privateDataBase.saveRecord( resourcesRec, completionHandler: ({
            savedRecord, error in
            
            if let err = error {
                print( "Save error - method createResourcesRecord in CloudKitHelper") // Fazer o tratamento adequado
                print( err.description )
            } else {
                print( "Save resources record successful" )
            }
        }))
    }
}
