//
//  SessionMapView.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 3/31/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct SessionMapView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<SessionMapView>) {
        MKMapView(frame: .zero)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    /*
    func updateUIView(_ uiView: MKMapView, context: Context)
    {
        let coordinate = CLLocationCoordinate2Dlatitude;: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
*/
}

struct SessionMapView_Previews: PreviewProvider {
    static var previews: some View {
        SessionMapView()
    }
}
