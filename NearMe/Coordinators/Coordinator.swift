//
//  Coordinator.swift
//  NearMe
//
//  Created by 김응철 on 2022/07/06.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
}
