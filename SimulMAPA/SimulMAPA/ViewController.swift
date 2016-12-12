//
//  ViewController.swift
//  SimulMAPA
//
//  Created by Mac Mini1 on 11/27/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapita: MKMapView!
    
    let locationMng = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationMng.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Ubicame(sender: UIButton) {
        locationMng.requestWhenInUseAuthorization()
        locationMng.desiredAccuracy = kCLLocationAccuracyBest //best
        //locationMng.requestLocation()
        locationMng.startUpdatingLocation()
     
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude) // sitio , son coordenadas... duh
        //span es alcance... pues, que tan lejos la camara.
        let span =  MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = center
        anotation.title = "Mi casita el coliseo."
        anotation.subtitle = "si, me llamo cesar maximus boletus"
        
        
        
        mapita.addAnnotation(anotation)
        mapita.setRegion(region, animated: true)
        
        locationMng.stopUpdatingLocation()
        
        
    }//funca
    
    
    
    //41.890338, 12.492220
}

