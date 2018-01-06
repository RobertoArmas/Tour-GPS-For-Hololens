//
//  LocationService.swift
//  Tour GPS For Hololens
//
//  Created by Roberto Armas on 12/2/17.
//  Copyright © 2017 Umpacto Soluciones Cia. Ltda. All rights reserved.
//

import UIKit
import CoreLocation

class LocationService: Service {
    
    func sendLocation(location: CLLocation){
        let locationHistory = LocationHistory();
        locationHistory.latitude = location.coordinate.latitude
        locationHistory.longitude = location.coordinate.longitude
        path = const.API_SEND_LOCATION
        print(locationHistory.toDictionary())
//        post(json: locationHistory.toDictionary()) { (done, response) in
//            if(done){
//
//            }
//        }
    }

}
