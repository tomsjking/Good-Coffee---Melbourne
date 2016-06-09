//
//  ViewController.swift
//  Good Coffee - Melbourne
//
//  Created by Tom King on 29/05/2016.
//  Copyright © 2016 Tom King. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- Annotations
    
    func getMapAnnotations() -> [Cafe] {
        var annotations:Array = [Cafe]()
        
        //load plist file
        
        var cafes: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("cafes", ofType: "plist") {
            cafes = NSArray(contentsOfFile: path)
        }
        if let items = cafes {
            for item in items {
                let lat = item.valueForKey("lat") as! Double
                let long = item.valueForKey("long")as! Double
                let annotation = Cafe(latitude: lat, longitude: long)
                annotation.title = item.valueForKey("title") as? String
                annotation.subtitle = item.valueForKey("food") as? String
                annotations.append(annotation)
            }
        }
        return annotations
    }

 
    //MARK:- Zoom to region
    func zoomToRegion() {
        let location = CLLocationCoordinate2D(latitude: -37.810147, longitude: 144.977506)
        let region = MKCoordinateRegionMakeWithDistance(location, 3000.0, 7000.0)
        mapView.setRegion(region, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomToRegion()
        
        let annotations = getMapAnnotations()
        // Add mappoints to Map
        mapView.addAnnotations(annotations)
        mapView.showsUserLocation = true

        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

