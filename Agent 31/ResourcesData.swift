//
//  ResourcesData.swift
//  Agent 31
//
//  Created by carlos alberto teixeira junior on 02/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import Foundation

private let _sharedInstance = ResourcesData()

class ResourcesData : NSObject, NSCoding {
    
    var gold: Int
    var metal: Int
    
    init(gold: Int, metal: Int) {
        self.gold = gold
        self.metal = metal
    }
    
    override init(){
        gold = 0
        metal = 0
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let gold = decoder.decodeObjectForKey("gold") as! Int
        let metal = decoder.decodeObjectForKey("metal") as! Int
        
        self.init(gold: gold, metal: metal)
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInt(Int32(self.gold), forKey: "gold")
        aCoder.encodeInt32(Int32(self.metal), forKey: "metal")
    }
    
    
    class var sharedInstance: ResourcesData {
        return _sharedInstance
    }
    
    func save(){
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.gold, forKey: "gold")
        defaults.setObject(self.metal, forKey: "metal")
        
        defaults.synchronize()
        
    }
    
    func load() {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let _ = defaults.objectForKey("gold") as? Int {
            self.gold = defaults.objectForKey("gold") as! Int
        }
        
        if let _ = defaults.objectForKey("metal") as? Int {
            self.metal = defaults.objectForKey("metal") as! Int
        }
        
    }
}