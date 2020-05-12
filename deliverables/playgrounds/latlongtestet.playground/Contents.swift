import UIKit
import CoreLocation

let address = "1 Infinite Loop, Cupertino, CA 95014"

//let geoCoder = CLGeocoder()
//geoCoder.geocodeAddressString(address) { (placemarks, error) in
//    guard
//        let placemarks = placemarks,
//        let location = placemarks.first?.location
//    else {
//        // handle no location found
//        return
//    }
//
//    // Use your location
//    print(location)
//}

func getCoordinate( addressString : String) {
    let geocoder = CLGeocoder()
    var lat = ""
    var long = ""
    geocoder.geocodeAddressString(addressString) { (placemarks, error) in
        if error == nil {
            if let placemark = placemarks?[0] {
                let location = placemark.location!
                print(location.coordinate)
                lat = String(location.coordinate.latitude)
                long = String(location.coordinate.longitude)
                
                print(lat)
                print(long)
                    
                //completionHandler(location.coordinate, nil)
                return
            }
        }
         
        //completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
    }
}

getCoordinate(addressString: address)
