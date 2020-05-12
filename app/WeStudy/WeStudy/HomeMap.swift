//
//  MapView.swift
//  WeStudy
//
//  Created by Khalea Berry on 1/28/20.Circle()
//  Copyright © 2020 Fifty. All rights reserved.
//

import MapKit
import SwiftUI
import CoreLocation

struct HomeMap: View {
    
    // Create locationmgr - ObservedObj captures location change events
    @ObservedObject private var locationManager = LocationManager()
    
    @State var searchField = ""
    
    @State var signedIn = false
    
    var body: some View {
        
        // Grab coordinate -- if location is not nil then set coord
         let coord = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        
        // Create variable for searchbar instance — you can access the text this way
        // let searchBar = SearchBar()
        
        return
            VStack {
                ZStack {
                    StudyMap()
                        .edgesIgnoringSafeArea(.all)
                    VStack (alignment:.trailing) {
                        Spacer()
                        SessionBtn()
                            //.position(x: 375)
                            .offset(x:150, y: -25)
                        
                        //search button to list view - will change to modal? view later
                        InitSearchButton()
                            //.position(x: 375, y: 325)
                            .offset(x:150, y: -25)
                        
                        
                        // searchBar

                    }
                        
                }
            }
            .navigationBarTitle(Text(""))
            .navigationBarHidden(false)
            .navigationBarItems(trailing: AccountButton())
        
    }
}

struct StudyMap: UIViewRepresentable {
    
    // Create locationmgr - ObservedObj captures location change events
    @ObservedObject private var locationManager = LocationManager()
    
    @ObservedObject var getJoined = FetchJoinedSessions()
    
    // Create Mapview frame within proper context
    func makeUIView(context: UIViewRepresentableContext<StudyMap>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // Set map to user location with updates
    func updateUIView(_ map: MKMapView, context: UIViewRepresentableContext<StudyMap>) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: map.userLocation.coordinate, span: span)
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
        
        // Add annotations to map
        if !(getJoined.joinedSessions.isEmpty) {
            for session in getJoined.joinedSessions {
                
                let coord = CLLocationCoordinate2D(latitude: CLLocationDegrees(Double(session.latitude) ?? 39.1709016), longitude: CLLocationDegrees(Double(session.longitude) ?? -86.5210828))
                
                let marker = MapMarker(title: session.title, locationName: session.address, coordinate: coord)
                map.addAnnotation(marker)
                
            }
        }
        
        
        
        
        
    }
    
    
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            HomeMap()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
    
}
