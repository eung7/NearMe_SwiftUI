//
//  ContentView.swift
//  NearMe
//
//  Created by 김응철 on 2022/07/05.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        MapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
