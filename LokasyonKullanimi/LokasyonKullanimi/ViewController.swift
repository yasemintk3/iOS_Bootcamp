//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by Yasemin TOK on 5.04.2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // en iyi hasssiyet
        locationManager.requestWhenInUseAuthorization() // arayüzde izni göstrecek
        locationManager.startUpdatingLocation() //konumu sürekli güncelleyerek verecek
        locationManager.delegate = self
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { //konum değiştikçe locations dizisine gönderecek
        
        let sonKonum = locations[locations.count-1] // locations dizisindeki son konumu almak için bir eksiği indeksine ulaşmamız lazım
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        
        labelEnlem.text = "Enlem : \(enlem)"
        labelBoylam.text = "Boylam : \(boylam)"
        labelHiz.text = "Hız : \(sonKonum.speed)"
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        
        mapView.setRegion(bolge, animated: true)
        
        /*let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "Konum"
        pin.subtitle = "\(enlem) - \(boylam)"
        mapView.addAnnotation(pin)*/
        
        mapView.showsUserLocation = true
    }
}
