//
//  ViewController.swift
//  Unit
//
//  Created by Siham Hadi on 3/9 ¨
//  Copyright © 2018 Unit All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    // Map
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager ()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
        let currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude,
        location.coordinate.longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: currentLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.coordinate)
        print(location.speed)
        
        self.mapView.showsUserLocation = true

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }


}

