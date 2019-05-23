//
//  LocationManager.swift
//  Altimeter
//
//  Created by Ilya Virnik on 28/12/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import CoreLocation
import MapKit

final class LocationManager: CLLocationManager {
    
    var isTrackingMap = false
    var mapView: MKMapView?
    var setWeather: ((_ location: CLLocation)->())?
    var setAltitude: ((_ ocation: CLLocation)->())?
    var currentLocation: MKCoordinateRegion?
    
    static let shared = LocationManager()
    
    override init() {
        super.init()
        self.delegate = self
        self.requestWhenInUseAuthorization()
        self.distanceFilter = kCLDistanceFilterNone
        self.desiredAccuracy = kCLLocationAccuracyBest
        self.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let defaultDelta = 0.00775
        if isTrackingMap {
            if let location = locations.last {
                let span = MKCoordinateSpan(latitudeDelta: defaultDelta, longitudeDelta: defaultDelta)
                let currentLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                let region = MKCoordinateRegion(center: currentLocation, span: span)
                self.currentLocation = region
                mapView?.setRegion(region, animated: true)
            }
            self.mapView?.showsUserLocation = true
            manager.stopUpdatingLocation()
        } else {
            if let firstLocation = locations.first {
                setWeather?(firstLocation)
            }
            if let lastLocation = locations.last {
                setAltitude?(lastLocation)
            }
        }
    }
}
