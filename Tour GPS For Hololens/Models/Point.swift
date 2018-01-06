//
//  Point.swift
//  Tour GPS For Hololens
//
//  Created by Roberto Armas on 12/2/17.
//  Copyright © 2017 Umpacto Soluciones Cia. Ltda. All rights reserved.
//

import UIKit
import CoreUmpacto

class Point:Model {
    
    var id: Int!
    var title: String!
    var description: String!
    var latitude: Double!
    var longitude: Double!
    
    override init(){
        self.id = -1;
        self.title = ""
        self.description = ""
        self.latitude = -1
        self.longitude = -1
    }

}
