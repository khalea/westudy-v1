//
//  DataCleaning.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation
import MapKit
 
class DataCleaning {
    func stringTocoords(string1: String, string2:String) -> CLLocationCoordinate2D {
        let lat = Double(string1)
        let lon = Double(string2)

        let coordinates = CLLocationCoordinate2D(latitude:lat!
                                , longitude:lon!)
        return coordinates
    }
    
    func convertTimeFormat(inputTime: String) -> String {
        
          
          let inFormatter = DateFormatter()
          inFormatter.dateFormat = "HH:mm:ss"
          inFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = inFormatter.date(from: inputTime)!
          
          let outFormatter = DateFormatter()
          outFormatter.dateFormat = "hh:mm a"
          outFormatter.locale = Locale(identifier: "en_US_POSIX")

        let outStr = outFormatter.string(from: date)
          
          return outStr
      }

      func convertDateFormat(inputDate: String) -> String {
        
          //let inputDate:String?

          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
          let date = dateFormatter.date(from: inputDate)
        

          let convertDateFormatter = DateFormatter()
          convertDateFormatter.dateFormat = "MMM dd"
           let newDate = convertDateFormatter.string(from: date!)

          return newDate
      }
    
  
}
