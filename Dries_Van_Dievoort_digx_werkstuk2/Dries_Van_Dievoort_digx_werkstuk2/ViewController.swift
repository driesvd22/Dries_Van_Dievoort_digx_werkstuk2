//
//  ViewController.swift
//  Dries_Van_Dievoort_digx_werkstuk2
//
//  Created by student on 20/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBAction func Refresh(_ sender: UIButton) {
        getData()
        print("halo")
        print(stations[0].address)
    }
    @IBOutlet weak var Tijd: UILabel!

    
    let jsonUrl = "https://api.jcdecaux.com/vls/v1/stations?contract=Bruxelles-Capitale&apiKey=0f6eeb84f56a0ec96b79278e957afed918b2d6db"
    var stations: Array<Station> = Array()
    var i = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        Tijd.text = "\(hour):\(minutes):\(seconds)"
    }
    
    func getData(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        Tijd.text = "\(hour):\(minutes):\(seconds)"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Station")
        request.returnsObjectsAsFaults = false

        do {
            let resultaten = try! managedContext.fetch(request)
            if resultaten.count > 0{
                
                
                for resultaat in resultaten as! [Station]
                {
                    stations.append(resultaat)
                    
                }
            }
            else{
        
        let url = URL(string: jsonUrl)
        let urlRequest = URLRequest(url: url!)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        DispatchQueue.main.async {
            
            let task = session.dataTask(with: urlRequest){ (data,response,error) in
                guard error == nil else {
                    print("error GET JSON")
                    print(error!)
                    return
                }
                guard let responseData = data
                    else{
                        print("Error: No Data received")
                        return
                }
                let json = try! JSONSerialization.jsonObject(with: responseData, options: []) as? NSArray
                for obj in json!
                {
                    self.i = self.i+1
                    if let objDict = obj as? NSDictionary
                    {
                        
                        let obj = NSEntityDescription.insertNewObject(forEntityName: "Station", into: managedContext) as! Station
                        if objDict.value(forKey: "name") != nil{
                            let objName = objDict.value(forKey: "name") as? String
                            if objName != nil{
                                obj.name = objName}
                        }
                        
                        if objDict.value(forKey: "number") != nil {
                            let objNumber = objDict.value(forKey: "number")  as! Int64
                            obj.number = objNumber
                        }
                        
                        if objDict.value(forKey: "address") != nil{
                            let objAddress = objDict.value(forKey: "address")  as? String
                            if objAddress != nil{
                                obj.address = objAddress}
                            
                        }
                        let objPosition = objDict.value(forKey:"position") as! NSDictionary
                        if objPosition.value(forKey: "lat") != nil{
                            let objLat = objPosition.value(forKey:"lat") as! Double
                            obj.latitude = objLat
                        }
                        
                        if objPosition.value(forKey: "lng") != nil{
                            let objLng = objPosition.value(forKey: "lng")  as! Double
                            obj.longitude = objLng
                        }
                        
                        if objDict.value(forKey: "banking") != nil{
                            let objBanking = objDict.value(forKey: "banking")  as! Bool
                            obj.banking = objBanking
                        }
                        
                        if objDict.value(forKey: "bonus") != nil{
                            let objBonus = objDict.value(forKey: "bonus")  as! Bool
                            obj.bonus = objBonus
                        }
                        
                        if objDict.value(forKey: "status") != nil{
                            let objStatus = objDict.value(forKey: "status")  as? String
                            if objStatus != nil{
                                obj.status = objStatus}
                        }
                        
                        if objDict.value(forKey: "contract_name") != nil{
                            let objContractName = objDict.value(forKey: "contract_name")  as? String
                            if objContractName != nil{
                                obj.contract_name = objContractName}
                        }
                        
                        if objDict.value(forKey: "bike_stands") != nil{
                            let objBikeStands = objDict.value(forKey: "bike_stands")  as! Int64
                            obj.bike_stands = objBikeStands
                        }
                        
                        if objDict.value(forKey: "available_bike_stands") != nil{
                            let objAvailBikeStands = objDict.value(forKey: "available_bike_stands")  as! Int64
                            obj.available_bike_stands = objAvailBikeStands
                        }
                        
                        if objDict.value(forKey: "available_bikes") != nil {
                            let objAvailBikes = objDict.value(forKey: "available_bikes")  as! Int64
                            obj.available_bikes = objAvailBikes
                        }
                        
                        
                        if objDict.value(forKey: "last_update") != nil {
                            let objLastUpdate = objDict.value(forKey: "last_update")  as! Int64
                            obj.last_update = objLastUpdate
                        }
                        
                        do {
                            print("halo")
                            try managedContext.save()
                            
                        }
                        catch
                        {
                            fatalError("Failure to save context: \(error)")
                        }
                        
                    }
                }
            }
            task.resume()
                }
            }
        }
    }



}
