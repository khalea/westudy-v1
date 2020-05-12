
//  JoinedSession.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation
import MapKit

struct JoinedSession: Identifiable, Decodable, Hashable {
    public var id: Int
    public var firstName: String
    public var lastName: String
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
    public var error: String
    public var message: String
    
    
}



class FetchJoinedSessions: ObservableObject {
    
    @Published var joinedSessions: [JoinedSession] = [
        .init(id: 1, firstName: "first", lastName: "last", title: "title", courseCode: "course", sessionDescription: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room: "room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x"),
        .init(id: 2, firstName: "first", lastName: "last", title: "title", courseCode: "course", sessionDescription: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room: "room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x"),
        .init(id: 3, firstName: "first", lastName: "last", title: "title", courseCode: "course", sessionDescription: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room:"room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x")
    ]

     init() {
        
        let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/GetJoinedSessions.php")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    
                    let decodedData = try JSONDecoder().decode([JoinedSession].self, from: todoData)
                    DispatchQueue.main.async {
                        self.joinedSessions = decodedData
                    }
                } else {
                    self.joinedSessions = []
                    print("No data")
                }
            } catch let jsonErr {
                self.joinedSessions = []
                print("Error", jsonErr)
            }
        }
        task.resume()
    }
}


//leave a session
class LeaveSession {
    
    struct ServerMessage: Codable {
        var message: String
        var error: Bool
    }
    
    func leaveSession(sessionID: Int, userID: Int) {
        
        //set api url
        guard let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/LeaveSession.php") else { return }
        
        // create url request object
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        
        //add parameters
        let params = "userID=\(userID)&sessionID=\(sessionID)";
        
        // add parameters to request body
        request.httpBody = params.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
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
                
            } catch let parsingError  {
                print("Error", parsingError )
            }
        }
        task.resume()
    }
}

//join a session
class JoinSession {
    func joinSession(sessionID: Int, userID: Int) {
        
        //set api url
        guard let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/JoinSession.php") else { return }
        
        // create url request object
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        
        //add parameters
        let postString = "userID=\(userID)&sessionID=\(sessionID)";
        
        // convert parameters to json and add to request body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
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




struct NearbySession: Identifiable, Codable {
    public var id: Int
    public var firstName: String
    public var lastName: String
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
    public var error: String
    public var message: String
    
    
}

class FetchNearbySessions: ObservableObject {
    
    @Published var nearbySessions: [JoinedSession] = [
        .init(id: 1, firstName: "first", lastName: "last", title: "title", courseCode: "course", sessionDescription: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room: "room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x"),
        .init(id: 2, firstName: "first", lastName: "last", title: "title", courseCode: "course", sessionDescription: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room: "room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x"),
        .init(id: 3, firstName: "first", lastName: "last", title: "title", courseCode: "course", sessionDescription: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room:"room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x")
    ]

     init() {
        
        let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/GetNearbySessions.php")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    
                    let decodedData = try JSONDecoder().decode([JoinedSession].self, from: todoData)
                    DispatchQueue.main.async {
                        self.nearbySessions = decodedData
                    }
                } else {
                    self.nearbySessions = []
                    print("No data")
                }
            } catch let jsonErr {
                self.nearbySessions = []
                print("Error", jsonErr)
            }
        }
        task.resume()
    }
}
