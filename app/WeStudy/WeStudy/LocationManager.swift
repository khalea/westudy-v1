//
//  LocationManager.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/5/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation
import MapKit

// ObservableObj alerts UI that something has changed

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    // Publish an event when location is updated
    @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone // Distance (horizontal) moved before updating location
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Get the location
        guard let location = locations.last else {
            return
        }
        
        // Set new location
        self.location = location
    }
}
