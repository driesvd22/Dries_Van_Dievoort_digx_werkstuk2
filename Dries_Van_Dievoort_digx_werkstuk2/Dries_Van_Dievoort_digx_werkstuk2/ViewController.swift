//
//  ViewController.swift
//  Dries_Van_Dievoort_digx_werkstuk2
//
//  Created by student on 20/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "https://api.jcdecaux.com/vls/v1/stations?contract=Bruxelles-Capitale&apiKey=0f6eeb84f56a0ec96b79278e957afed918b2d6db")
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil
            {
                print("ERROR")
            }
            else
            {
                if let mydata = data{
                    
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: mydata, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let position = myJson.value(forKey: "position") as! NSArray?{
                            if let lat = position.value(forKey: "lng") as AnyObject?{
                                print(lat)
                            }
                        }
                        
                    }catch
                    {
                        
                    }
                }
            }
        }
            task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

