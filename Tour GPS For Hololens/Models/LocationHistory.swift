//
//  LocationHistory.swift
//  Tour GPS For Hololens
//
//  Created by Roberto Armas on 12/2/17.
//  Copyright © 2017 Umpacto Soluciones Cia. Ltda. All rights reserved.
//

import UIKit
import CoreUmpacto

class LocationHistory:Model {
    
    var latitude: Double!
    var longitude: Double!
    var pair_id: Int!
    
    override init(){
        self.latitude = -1
        self.longitude = -1
        self.pair_id = 1
    }
    

}
