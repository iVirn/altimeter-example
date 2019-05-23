//
//  MainVC.swift
//  Altimeter
//
//  Created by Ilya Virnik on 24/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class MainVC: UIViewController {

    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var altitudeLabel: UILabel!
    @IBOutlet private weak var conditionImageView: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    private lazy var altimeter = { return CMAltimeter() }()
    private var firstLocationUpdate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWeatherOnce()
        measurePressure()
        measureAltitude()
        UITabBar.appearance().tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LocationManager.shared.isTrackingMap = false
    }
    
    private func measurePressure() {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: { (altitudeData: CMAltitudeData?, error: Error?) in
                let pressure = altitudeData!.pressure.floatValue
                self.pressureLabel.text = String(format: "Pressure:\n%.1f kPa", pressure)
            })
        } else {
            self.pressureLabel.text = "Barometer\n is not available"
        }
    }
    
    private func setWeatherOnce() {
        LocationManager.shared.setWeather = { [unowned self] location in
            guard self.firstLocationUpdate else { return }
            Downloader.setWeather(latitude: location.coordinate.latitude, longtitude: location.coordinate.longitude) { [unowned self] response in
                DispatchQueue.main.async {
                    guard let image = Icons.iconsSet[response.dayTime] else { return }
                    self.conditionImageView.image = image
                    self.tempLabel.attributedText = response.temp.celciusDarkAttributedString(fontSize: 144)
                }
            }
            self.firstLocationUpdate = false
        }
    }
    
    private func measureAltitude() {
        LocationManager.shared.setAltitude = { [unowned self] location in
            let altitude = location.altitude
            self.altitudeLabel.text = String(format: "Altitude:\n%.1f m", altitude)
        }
    }
}
