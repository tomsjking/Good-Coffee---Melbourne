//
//  Cafe.swift
//  Good Coffee - Melbourne
//
//  Created by Tom King on 29/05/2016.
//  Copyright © 2016 Tom King. All rights reserved.
//

import Foundation
import MapKit

class Cafe: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var latitude: Double
    var longitude:Double
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

