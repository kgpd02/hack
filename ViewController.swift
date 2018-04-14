//
//  ViewController.swift
//  рфсл2
//
//  Created by Василий on 14.04.18.
//  Copyright © 2018 Василий. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var LocY: UILabel!
    @IBOutlet weak var LocX: UILabel!
   // @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
       // map.setRegion(region, animated: true)
        
      //  print(location.altitude)
      //  print(location.speed)
       // print(location.coordinate.latitude)
        LocX.text = String(location.coordinate.latitude)
        LocY.text = String(location.coordinate.longitude)
        
      //  self.map.showsUserLocation = true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self as! CLLocationManagerDelegate
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  



}

