//
//  Session.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/27/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import Foundation
import CoreLocation
import Combine



struct CreatedSession: Codable, Identifiable {
    public var id: Int
    public var ownerID: Int
    public var title: String
    public var courseCode: String
    public var sessionDescription: String
    public var date: String
    public var startTime: String
    public var endTime: String
    public var address: String
    public var room: String
    public var isPrivate: String
    public var latitude: String
    public var longitude: String
    
    
    
//    init(title: String, courseCode: String, description: String, time: Date, owner: String, location: Location, attendees: [String]) {
//    self.title = title
//    self.courseCode = courseCode
//    self.sessionDescription = description
//    self.time = time
//    self.owner = owner
//    self.location = location
}

class FetchCreatedSessions: ObservableObject {
    
    let objectWillChange = ObservableObjectPublisher()

  // 1.
  //@Published var sessions = [CreatedSession]()
    
     //automatically refresh views after edit
     @Published var sessions = [CreatedSession]() {
        willSet {
            objectWillChange.send()
        }
      }
     
    init() {
        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/GetCreatedSessions.php")!
        // 2.
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([CreatedSession].self, from: todoData)
                    DispatchQueue.main.async {
                        self.sessions = decodedData
                    }
                } else {
                    self.sessions = []
                    print("No data")
                }
            } catch let jsonErr {
                self.sessions = []
                print("Error", jsonErr)
            }
        }
        task.resume()
    }
}
