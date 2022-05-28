//
//  MapScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.2253, longitude: -76.4951), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    let mapFilters: MKPointOfInterestFilter = MKPointOfInterestFilter(including: [])

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .preferredColorScheme(.dark)
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .frame(maxHeight: .infinity, alignment: .top)
                .onAppear(perform: {
                    MKMapView.appearance().pointOfInterestFilter = .some(mapFilters)
                })
        }
        
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
