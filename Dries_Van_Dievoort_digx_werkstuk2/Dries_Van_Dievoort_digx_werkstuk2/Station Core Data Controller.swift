//
//  Station Core Data Controller.swift
//  Dries_Van_Dievoort_digx_werkstuk2
//
//  Created by student on 29/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import Foundation
import CoreData


public class StationWerkstuk2: NSManagedObject{
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Station> {
        return NSFetchRequest<Station>(entityName: "Station")
    }
    
    @NSManaged public var address: String?
    @NSManaged public var available_bike_stands: Int64
    @NSManaged public var available_bikes: Int64
    @NSManaged public var banking: Bool
    @NSManaged public var bike_stands: Int64
    @NSManaged public var bonus: Bool
    @NSManaged public var contract_name: String?
    @NSManaged public var last_update: Int64
    @NSManaged public var lat: Double
    @NSManaged public var lng: Double
    @NSManaged public var name: String?
    @NSManaged public var number: Int64
    @NSManaged public var status: String?
    
}
