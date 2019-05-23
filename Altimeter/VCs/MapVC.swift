//
//  MapVC.swift
//  Altimeter
//
//  Created by Ilya Virnik on 24/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import MapKit

class MapVC: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var locationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.shared.mapView = self.mapView
        locationButton.layer.cornerRadius = locationButton.frame.height / 2
        locationButton.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LocationManager.shared.isTrackingMap = true
    }
    
    @IBAction private func setCurrentLocation(_ sender: UIButton) {
        LocationManager.shared.mapView?.userTrackingMode = .follow
    }
}
