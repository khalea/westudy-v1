//
//  SessionMap.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import MapKit



struct SessionMap: UIViewRepresentable {

    var string1: String
    var string2: String
    
    //var coordinate: CLLocationCoordinate2D
    var coordinates: CLLocationCoordinate2D{
        let lat = Double(string1)
          let lon = Double(string2)
        
        let coordinates = CLLocationCoordinate2D(latitude:lat!
        , longitude:lon!)
        
        return coordinates
    }
   
    
    
    func makeUIView(context: Context) -> MKMapView {
          MKMapView(frame: .zero)
      }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
          let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        //set region
          let region = MKCoordinateRegion(center: coordinates, span: span)
              uiView.setRegion(region, animated: true)
        
        //add pin
          let pin = MKPlacemark(coordinate: coordinates)
              uiView.addAnnotation(pin)
        
    }
    

}

struct SessionMap_Previews: PreviewProvider {
    static var previews: some View {
        SessionMap(string1: "00.000000", string2: "00.000000")
    }
}
