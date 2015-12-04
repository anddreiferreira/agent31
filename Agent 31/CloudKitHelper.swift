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
    let gunsRecordId = CKRecordID(recordName: "GunsRec")
    
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
    
    func saveGunsProperties(guns: GunsData) {
        
        self.privateDataBase.fetchRecordWithID(self.gunsRecordId) {
            fetchedRecord, error in
            if let _ = error {
                self.createGunsRecord(guns.gun1, gun2: guns.gun2)
            } else {
                fetchedRecord?.setValue(guns.gun1, forKey: "Gun1")
                fetchedRecord?.setValue(guns.gun2, forKey: "Gun2")
                
                self.privateDataBase.saveRecord(fetchedRecord!) {
                    savedRec, error in
                    if let err = error {
                        debugPrint("Save error - method saveGunsProperties in CloudKitHelper")
                        debugPrint(err.description)
                    } else {
                        debugPrint("Guns updated successful")
                    }
                }
            }
        }
    }
    
    func fetchGunsProperties(guns: GunsData)
    {
        self.privateDataBase.fetchRecordWithID(self.gunsRecordId) {
            fetchedRecord, error in
            
            if let err = error {
                debugPrint("Error fetching data - method fetchGunsProperties in CloudKitHelper")
                debugPrint(err.description)
                NSNotificationCenter.defaultCenter().postNotificationName("gunsDataException", object: nil)
            } else {
                debugPrint("Fetching Guns Data")
                
                guns.gun1 = fetchedRecord?.objectForKey("Gun1") as! String
                let gun1 = guns.gun1
                guns.gun1Name = gun1.substringWithRange(gun1.startIndex ... gun1.endIndex.advancedBy(-7))
                guns.gun1Level = Int(gun1.substringWithRange(gun1.startIndex.advancedBy(6) ... gun1.endIndex.advancedBy(-4)))!
                guns.gun1Blocked = Int(gun1.substringWithRange(gun1.startIndex.advancedBy(9) ..< gun1.endIndex))!
                
                guns.gun2 = fetchedRecord?.objectForKey("Gun2") as! String
                let gun2 = guns.gun2
                guns.gun2Name = gun2.substringWithRange(gun2.startIndex ... gun2.endIndex.advancedBy(-7))
                guns.gun2Level = Int(gun2.substringWithRange(gun2.startIndex.advancedBy(6) ... gun2.endIndex.advancedBy(-4)))!
                guns.gun2Blocked = Int(gun2.substringWithRange(gun2.startIndex.advancedBy(9) ..< gun2.endIndex))!
                
                NSNotificationCenter.defaultCenter().postNotificationName("gunsDataNotification", object: nil)
            }
        }
    }
    
    private func createGunsRecord(gun1: String, gun2: String) {
        let gunsRec = CKRecord(recordType: "Guns", recordID: self.gunsRecordId)
        
        gunsRec.setValue(gun1, forKey: "Gun1")
        gunsRec.setValue(gun2, forKey: "Gun2")
        
        self.privateDataBase.saveRecord(gunsRec) {
            savedRecord, error in
            
            if let err = error {
                debugPrint("Save error - method createGunsRecord in CloudKitHelper") // Fazer o tratamento adequado
                debugPrint(err.description)
            } else {
                debugPrint("Save guns record successful")
            }
        }
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
