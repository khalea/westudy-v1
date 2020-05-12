//
//  PostSession.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 3/11/20.
//  Copyright © 2020 Fifty. All rights reserved.
//


import Foundation
import Combine
import CoreLocation



// let delegate = UIApplication.shared.delegate as! AppDelegate
//add id to return message
//add server message to alert
struct ServerMessage: Codable {
    var error: Bool
    var message: String
}

class PostSession: ObservableObject {

    //add session to database
    func postSession(ownerID: Int, title: String, courseCode: String, sessionDescription: String, date: Date, startTime: Date, endTime:Date, address: String, room: String, isPrivate: Bool) {
        
        //convert date to date string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: date)
        
        //convert time to time string
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let strTime1 = timeFormatter.string(from: startTime)
        let strTime2 = timeFormatter.string(from: endTime)
        
        //convert address to lat/long
         let geocoder = CLGeocoder()
         var lat = ""
         var long = ""
         geocoder.geocodeAddressString(address) { (placemarks, error) in
              if error == nil {
                  if let placemark = placemarks?[0] {
                      let location = placemark.location!
                      print(location.coordinate)
                      lat = String(location.coordinate.latitude)
                      long = String(location.coordinate.longitude)
                      
                      print(lat)
                      print(long)
                    
                     return
                  }
              }
              else {
                print("Some error occurred")
            }
          }

        
        
        //set api url
        guard let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/insertsession.php") else { return }
        
        // create url request object
        var request = URLRequest(url: url);
        request.httpMethod = "POST";

        //add parameters
        let postString = "ownerID=\(ownerID)&title=\(title)&sessionDescription=\(sessionDescription)&date=\(strDate)&startTime=\(strTime1)&endTime=\(strTime2)&address=\(address)&room=\(room)&courseCode=\(courseCode)&isPrivate=\(isPrivate)&latitude=\(lat)&longitude=\(long)";
        
        // convert parameters to json and add to request body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        //set http request header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
         // start API call
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data,
                // print error message if request experiences an error
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                
                // make decoder object
                let decoder = JSONDecoder()
                
                // Decode dataResponse from json object to ServerMessageobject
                let smObject = try decoder.decode(ServerMessage.self, from: dataResponse)
                print(smObject.message)
                
                 

                
            } catch let jsonErr {
                print("Error", jsonErr)
            }
        }
        task.resume()
    }
    
}
