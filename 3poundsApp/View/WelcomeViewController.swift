//
//  ViewController.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 23.02.2021.
//

import UIKit
import CoreLocation

class WelcomeViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ekrem")
        
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            // you're good to go!
//            print(status.hashValue)
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.count)
        print(locations[0].coordinate.longitude)
        print("sa")
    }
}

