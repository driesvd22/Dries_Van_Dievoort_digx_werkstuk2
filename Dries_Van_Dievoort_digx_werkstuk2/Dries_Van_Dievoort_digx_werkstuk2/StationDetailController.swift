//
//  StationDetailController.swift
//  Dries_Van_Dievoort_digx_werkstuk2
//
//  Created by VAN DIEVOORT Dries (s) on 31/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit
import MapKit

class StationDetailController: UIViewController  {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var bikesAvail: UILabel!
    @IBOutlet weak var bikeStandsAvail: UILabel!
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    var station: Station = Station()
    var stations: Array<Station> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = station.name
        if station.status == "OPEN" {
            self.status.textColor = UIColor.green
        }
        else{
            self.status.textColor = UIColor.red
        }
        if station.available_bikes < 5 {
            self.bikesAvail.textColor = UIColor.red
        }
        if station.available_bikes < 10 && station.available_bikes >= 5
        {
            self.bikesAvail.textColor = UIColor.orange
        }
        if station.available_bikes >= 10  {
            self.bikesAvail.textColor = UIColor.green
        }
        if station.available_bike_stands < 5 {
            self.bikeStandsAvail.textColor = UIColor.red
        }
        if station.available_bike_stands < 10 && station.available_bike_stands > 5
        {
            self.bikeStandsAvail.textColor = UIColor.orange
        }
        if station.available_bike_stands >= 10  {
            self.bikeStandsAvail.textColor = UIColor.green
        }
        self.status.text = station.status
        self.bikesAvail.text = String(station.available_bikes)
        self.bikeStandsAvail.text = String(station.available_bike_stands)
        self.address.text = station.address
        
        for station in stations {
            let location = CLLocationCoordinate2DMake(station.latitude, station.longitude)
            let annotation: StationAnnotation =  StationAnnotation(coordinate: location, title: station.name!, subtitle: station.status!)
            map.addAnnotation(annotation)
        }
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.001,0.001)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(station.latitude, station.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
    }
}

