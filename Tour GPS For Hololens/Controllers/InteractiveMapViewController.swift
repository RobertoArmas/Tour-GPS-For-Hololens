//
//  InteractiveMapViewController.swift
//  Tour GPS For Hololens
//
//  Created by Roberto Armas on 9/30/17.
//  Copyright © 2017 Umpacto Soluciones Cia. Ltda. All rights reserved.
//

import UIKit
import GoogleMaps

class InteractiveMapViewController: TourGPSForHololensViewController {
    
    @IBOutlet weak var toogleActionButtom: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    var isRecording = false
    
    lazy var locationManager:CLLocationManager = self.setupLocationManager()
    var locationService : LocationService = LocationService()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMapView()
        self.loadPoints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // Setup: Google Maps + Location Manager
    
    func setupMapView(){
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    private func setupLocationManager() -> CLLocationManager{
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.allowsBackgroundLocationUpdates = true
        manager.requestWhenInUseAuthorization()
        return manager
    }
    
    // POINTS
    
    func loadPoints(){
        let service = PointService()
        service.getPoints { (points) in
            for point in points {
                let position = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
                let marker = GMSMarker(position: position)
                marker.title = point.title
                marker.map = self.mapView
            }
       
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func toogleAction(_ sender: Any) {
        isRecording = !isRecording
        if(isRecording){
            toogleActionButtom.setTitle("Stop", for: .normal)
            locationManager.startUpdatingLocation()
        }else{
             toogleActionButtom.setTitle("Start", for: .normal)
            locationManager.stopUpdatingLocation()
        }
    }
    

}

// MARK: - Location Manager
extension InteractiveMapViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        if(isRecording){
            self.locationService.sendLocation(location: location)
        }
      
    }
    
}
