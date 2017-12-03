//
//  NameViewController.swift
//  407tutorial1
//
//  Created by Zhicheng on 2/25/16.
//  Copyright © 2016 Zhicheng. All rights reserved.
//

import UIKit
import MapKit


class NameViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var labName: UILabel!
 
    var currentName : Name?
    var place : Place?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabBarController?.tabBar.hidden = true

        centerMapOnLocation(CLLocation(latitude: 43.069761, longitude: -89.406405))

        place = Place(title: "Friend Location", locationName: "location name", discipline: "what is this", coordinate:CLLocationCoordinate2D(latitude: 43.069761, longitude: -89.406405))
        
        mapView.addAnnotation(place!)
        
        print("view did load456")
        print("view did load2")
        print("view did load3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func onOpenMap(sender: AnyObject) {

        let regionSpan = MKCoordinateRegionMakeWithDistance(place!.coordinate, regionRadius, regionRadius)

        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
        ]
        
        place!.mapItem().openInMapsWithLaunchOptions(options)
    }
}
