//
//  Service.swift
//  Tour GPS For Hololens
//
//  Created by Roberto Armas on 12/2/17.
//  Copyright © 2017 Umpacto Soluciones Cia. Ltda. All rights reserved.
//

import UIKit
import CoreUmpacto

class Service: WebService {
    
    let const: TourConstants = TourConstants()
    
    init() {
        super.init(baseUrl: const.BASE_URL)
    }
    
}
