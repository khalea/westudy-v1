//  PostQuery.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 4/15/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import UIKit
import PlaygroundSupport
import CoreLocation
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

// all search results
struct SessionResult: Codable {

    //define structure for session result
    public var sessionID: Int
    public var ownerID: Int
    public var title: String
    public var courseCode: String
    public var description: String
    public var date: String
    public var startTime: String
    public var endTime: String
    public var address: String
    public var room: String
    public var isPrivate: String
    public var latitude: String
    public var longitude: String
//    public var category: String
}
var userQuery = "math"

// send query to database
class PostQuery: ObservableObject {
    
    @Published var sessions = [SessionResult]()

    init() {
        
        // designate PHP for search
        let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/Search2.php")!

            // Create url request object
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
        let param = "userQuery=\(userQuery)";
            
            // Add param to request body
            request.httpBody = param.data(using: String.Encoding.utf8)
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                do {
                    if let todoData = data {
                        // 3.
                        let decodedData = try JSONDecoder().decode([SessionResult].self, from: todoData)
                        DispatchQueue.main.async {
                            self.sessions = decodedData
                            print(self.sessions)
                        }
                    } else {
                        print("No data")
                    }
                } catch let jsonErr {
                    print("Error", jsonErr)
                }
            }
        task.resume()
    }
}

var pq = PostQuery()
print(pq.sessions)

