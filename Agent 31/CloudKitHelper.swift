//
//  CloudKitHelper.swift
//  Agent 31
//
//  Created by Henrique Dutra on 27/11/15.
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
    
    func saveCharacterProperties( character: CharacterData )
    {
        
        self.privateDataBase.fetchRecordWithID( self.characterRecordId, completionHandler: ({
            fetchedRecord, error in
            
            if let _ = error {
                self.createCharacterRecord( character )
            } else {
                fetchedRecord?.setValue( character.jump, forKey: "Jump" )
                fetchedRecord?.setValue( character.speed, forKey: "Speed" )
                fetchedRecord?.setValue( character.shootingRange, forKey: "ShootingRange" )
                fetchedRecord?.setValue( character.shootingPower, forKey: "ShootingPower" )
                fetchedRecord?.setValue( character.backPack, forKey: "BackPack" )
                fetchedRecord?.setValue( character.level, forKey: "Level" )
                
                self.privateDataBase.saveRecord( fetchedRecord!, completionHandler: ({
                    savedRecord, sError in
                    
                    if let sErr = sError {
                        debugPrint( "Save Error - method saveCharacterProperties in CloudKitHelper" ) //Fazer o tratamento adequado
                        debugPrint( sErr.description )
                    } else {
                        debugPrint( "Character record updated successful" )
                    }
                }))
            }
            
        }))
    }
    
    func fetchCharacterProperties(character: CharacterData) // Pass by reference
    {
        self.privateDataBase.fetchRecordWithID(self.characterRecordId, completionHandler: ({
            fetchedRecord, error in
            
            if let err = error {
                debugPrint("Error fetching data - method fetchCharacterProperties in CloudKitHelper")
                debugPrint(err.description)
                NSNotificationCenter.defaultCenter().postNotificationName("characterDataException", object: nil)
            } else {
                debugPrint( "Fetching Character Data")
                character.jump = fetchedRecord?.objectForKey("Jump") as! Int
                character.backPack = fetchedRecord?.objectForKey("BackPack") as! Int
                character.level = fetchedRecord?.objectForKey("Level") as! Int
                character.shootingPower = fetchedRecord?.objectForKey("ShootingPower") as! Int
                character.shootingRange = fetchedRecord?.objectForKey("ShootingRange") as! Int
                character.speed = fetchedRecord?.objectForKey("Speed") as! Int
                NSNotificationCenter.defaultCenter().postNotificationName("characterDataNotification", object: nil)
            }
        }))
    }
    
    private func createCharacterRecord( character: CharacterData ) {
        
        let newRecord = CKRecord( recordType: "Character", recordID: self.characterRecordId )
        newRecord.setValue( character.jump, forKey: "Jump" )
        newRecord.setValue( character.speed, forKey: "Speed" )
        newRecord.setValue( character.shootingRange, forKey: "ShootingRange" )
        newRecord.setValue( character.shootingPower, forKey: "ShootingPower" )
        newRecord.setValue( character.backPack, forKey: "BackPack" )
        newRecord.setValue( character.level, forKey: "Level" )
        
        self.privateDataBase.saveRecord( newRecord, completionHandler: ({
            savedRecord, error in
            if let err = error {
                debugPrint( "Save Error - method createCharacterRecord in CloudKitHelper" ) // Fazer tratamento adequado
                debugPrint( err.description )
            } else {
                debugPrint( "Save character record successful" )
            }
        }))
    }
}

// MARK: CRUD to Guns' attributes
extension CloudKitHelper {
    
    func saveGunProperties( type: String, level: Int, price: Int, blocked: Bool, secret: Bool, time: NSTimeInterval ) {
        
        let gunId = CKRecordID(recordName: type)
        
        self.privateDataBase.fetchRecordWithID( gunId, completionHandler: ({
            fetchedRecord, error in
            
            if let _ = error {
                self.createGunRecord( type, level: level, price: price, blocked: blocked, secret: secret, time: time )
            } else {
                let blockedInt = blocked == true ? 1 : 0
                let secretInt = secret == true ? 1 : 0
                
                fetchedRecord!.setValue( level, forKey: "Level" )
                fetchedRecord!.setValue( price, forKey: "Price" )
                fetchedRecord!.setValue( blockedInt, forKey: "Blocked" )
                fetchedRecord!.setValue( secretInt, forKey: "Secret" )
                fetchedRecord!.setValue( time, forKey: "Time" )
                
                self.privateDataBase.saveRecord( fetchedRecord!, completionHandler: ({
                    savedRec, sError in
                    if let sErr = sError {
                        debugPrint( "Error trying to update gun" ) // Fazer tratamento adequado
                        debugPrint( sErr.description )
                    } else {
                        debugPrint( "Gun update successful")
                    }
                }))
                
            }
        }))
    }
    
    private func createGunRecord ( type: String, level: Int, price: Int, blocked: Bool, secret: Bool, time: NSTimeInterval ) {
        
        // OBS: Fazer a verificacao do nome numa lista com o nome das armas validas
        
        let gunId = CKRecordID( recordName: type )
        let gunRec = CKRecord(recordType: "Gun", recordID: gunId)
        
        let blockedValue = blocked == true ? 1 : 0
        let secretValue = secret == true ? 1 : 0
        
        gunRec.setValue( type, forKey: "Type")
        gunRec.setValue( level, forKey: "Level")
        gunRec.setValue( price, forKey: "Price")
        gunRec.setValue( blockedValue, forKey: "Blocked")
        gunRec.setValue( secretValue, forKey: "Secret")
        gunRec.setValue( time, forKey: "Time")
        
        self.privateDataBase.saveRecord( gunRec, completionHandler: ({
            savedRec, error in
            if let err = error {
                debugPrint( "Error creating gun record" ) // Fazer tratamento adequado
                debugPrint( err.description )
            } else {
                debugPrint( "New gun saved with success")
            }
        }))
    }
}

// MARK: CRUD to Resources' attributes
extension CloudKitHelper {
    
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
                        debugPrint( "Save error - method saveResourcesProperties in CloudKitHelper" ) // Fazer tratamento adequado
                        debugPrint( err.description )
                    } else {
                        debugPrint( "Resources updated successful" )
                    }
                }))
            }
        }))
    }
    
    func fetchResourcesProperties(resources: ResourcesData ) // Pass by reference
    {
        self.privateDataBase.fetchRecordWithID(self.resourcesRecordId, completionHandler: ({
            fetchedRecord, error in
            
            if let err = error {
                debugPrint("Error fetching data - method fetchResourcesProperties in CloudKitHelper")
                debugPrint(err.description)
                NSNotificationCenter.defaultCenter().postNotificationName("resourcesDataException", object: nil)
            } else {
                debugPrint( "Fetching Resources Data")
                resources.metal = fetchedRecord?.objectForKey("Metal") as! Int
                resources.gold = fetchedRecord?.objectForKey("Gold") as! Int
                resources.diamond = fetchedRecord?.objectForKey("Diamond") as! Int
                NSNotificationCenter.defaultCenter().postNotificationName("resourcesDataNotification", object: nil)
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
                debugPrint( "Save error - method createResourcesRecord in CloudKitHelper") // Fazer o tratamento adequado
                debugPrint( err.description )
            } else {
                debugPrint( "Save resources record successful" )
            }
        }))
    }
}
