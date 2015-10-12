//
//  FNBSMapView.swift
//  findmybusnj
//
//  Created by David Aghassi on 10/12/15.
//  Copyright © 2015 David Aghassi. All rights reserved.
//

import Foundation
import MapKit

extension FindNearByStopsController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? PlacesAnnotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            }
            else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
//                view.rightCalloutAccessoryView = some custom icon we will use for navigating
                
                return view
            }
        }
        
        return nil
    }
}