//
//  Place.swift
//  407tutorial1
//
//  Created by Zhicheng on 2/27/16.
//  Copyright © 2016 Zhicheng. All rights reserved.
//

import Foundation
import MapKit
import AddressBook


class Place: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    
    let regionRadius: CLLocationDistance = 1000

    func mapItem() -> MKMapItem {
        
    

        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "1111"
    
        return mapItem

    }

}