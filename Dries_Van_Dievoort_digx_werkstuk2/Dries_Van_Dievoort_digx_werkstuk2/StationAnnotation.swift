//
//  StationAnnotation.swift
//  Dries_Van_Dievoort_digx_werkstuk2
//
//  Created by student on 29/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit
import MapKit

class StationAnnotation: NSObject, MKAnnotation {
    
    var address: String?
    var available_bike_stands: Int64
    var available_bikes: Int64
    var banking: Bool
    var bike_stands: Int64
    var bonus: Bool
    var contract_name: String?
    var last_update: Int64
    var coordinate: CLLocationCoordinate2D
    var name: String?
    var number: Int64
    var status: String?
    
    
    init (address:String,AvailBikeStands:Int64,AvailBikes:Int64,banking:Bool,bonus:Bool,BikeStands:Int64,ContrName:String,LastUpdate:Int64,coordinate:CLLocationCoordinate2D, name:String,number:Int64,status:String )
    {
        self.address = address
        self.available_bike_stands = AvailBikeStands
        self.available_bikes = AvailBikes
        self.banking = banking
        self.bonus = bonus
        self.bike_stands = BikeStands
        self.contract_name = ContrName
        self.last_update = LastUpdate
        self.coordinate = coordinate
        self.name = name
        self.number = number
        self.status = status
    }
    
    
    
    
    
}

