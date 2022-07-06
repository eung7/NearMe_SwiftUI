//
//  ContentView.swift
//  NearMe
//
//  Created by 김응철 on 2022/07/05.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    @State private var search: String = ""
    
    private func getNearByLandmarks() {
        guard let location = locationManager.location else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response, error == nil else { return }
            let mapItems = response.mapItems
            mapItems.map {
                print($0.placemark)
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView()
            
            TextField("Search",
                      text: $search,
                      onEditingChanged: { _ in
                
            },
                      onCommit: {
                getNearByLandmarks()
            })
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
