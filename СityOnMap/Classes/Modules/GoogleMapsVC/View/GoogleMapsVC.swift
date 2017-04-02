//
//  GoogleMapsVC
//  GoogleMapsVCViewController.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 02/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsVC: UIViewController, GoogleMapsVCViewInput {
    @IBOutlet weak var mapView: GMSMapView!
    
    let configurator = GoogleMapsVCModuleConfigurator()
    var presenter: GoogleMapsVCViewOutput!
    
    var longitude: Double? = 0.0
    var latitude: Double? = 0.0
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configureModuleForViewInput(viewInput: self)
        self.navigationItem.title = "GoogleMaps"
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude!, longitude!)
        marker.icon = UIImage.init(named: "marker")
        marker.map = mapView
    }
}

// MARK:- ViewControllerProtocol
extension GoogleMapsVC: ViewControllerProtocol {
    static func storyBoardName() -> String {
        return "Main"
    }
}

















