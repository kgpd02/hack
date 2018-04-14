import UIKit
import GoogleMaps
import CoreLocation
import MapKit
import CoreMotion


class MapsController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var locY: UILabel!
    @IBOutlet weak var locX: UILabel!
    let manager = CLLocationManager()
    //var locX: String = ""
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        //let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        //  map.setRegion(region, animated: true)
        // print("test")
        //print(location.altitude)
        // print(location.speed)
        // print(location.coordinate.latitude)
       // locX.text? = String(location.coordinate.latitude)
        // LocX.text = String(location.coordinate.latitude)
        // LocY.text = String(location.coordinate.longitude)
        
        // self.map.showsUserLocation = true
      //  print(locX)
        
    }
   // var locX: String = ""
    //var locY: String = ""

    var mapView: GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locX.text = "60"
       // print("test")
       // print(locX)
        //var locX: String = ""
            
        
        GMSServices.provideAPIKey("AIzaSyA0QlNOrMY6JU7wqgBXBamQq1v9wbR11Z0")
        let camera = GMSCameraPosition.camera(withLatitude: Double(locX.text!)!, longitude: -122.378945, zoom: 12)
       // let camera = GMSCameraPosition.camera(withLatitude: Double(locX)!, longitude: Double(locY)!, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(37, -122)
        //let currentLocation = CLLocationCoordinate2DMake(Double(locX)!, Double(locY)!)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "you"
        marker.map = mapView
        print(locX)
      
        
        manager.delegate = self as! CLLocationManagerDelegate
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: "next")
    }
    
    
}


