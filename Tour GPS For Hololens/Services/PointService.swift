//
//  PointService.swift
//  Tour GPS For Hololens
//
//  Created by Roberto Armas on 12/2/17.
//  Copyright © 2017 Umpacto Soluciones Cia. Ltda. All rights reserved.
//

import UIKit

class PointService: Service {
    
    func getPoints(completion: @escaping ( _ points: [Point]) -> Void){
        self.path = self.const.API_GET_POINTS;
        self.get { (done, response) in
            if(done){
                let pointsArray = response.response!["points"] as! Array<Dictionary<String,Any>>
                var points: [Point] = []
                for pointJson in pointsArray
                {
                    let point = Point()
                    point.id = pointJson["id"] as! Int
                    point.title = pointJson["title"] as! String
                    point.description = pointJson["description"] as! String
                    point.latitude = pointJson["latitude"] as! Double
                    point.longitude = pointJson["longitude"] as! Double
                    
                    points.append(point)
                }
                completion(points)
            }
        }
    }

}
