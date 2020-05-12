//  SearchResults.swift
//  formerly SessionRetrieve.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 3/12/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation

// user's input from SearchBar.swift
struct UserQuery : Hashable, Codable {
    public var userQuery: String;
}

struct Category : Codable {
    // designate result type (user, session, group)
    public var type: Category

    enum Category: String, Codable {
        case users = "user"
        case groups = "group"
        case sessions = "session"
    }
}

// all search results
struct SessionResult : Codable {
    // foundation for session result: Sessions.swift by Khalea Berry - using same structures for consistency

    //define structure for session result
    public var sessionID: Int
    public var ownerID: Int
    public var title: String
    public var courseCode: String
    public var description: String
    public var date: String
    public var startTime: String
    public var endTime: String
    public var owner: String
    public var address: String
    public var room: String
    public var isPrivate: String
    public var latitude: String
    public var longitude: String
    public var category: String
}


struct UserResult : Codable, Identifiable {
    //define structure for user result
    public var id: Int
    public var userName: String
    public var firstName: String
    public var lastName: String
    public var email: String
    public var phone: String
    public var bio: String
    public var category: String
}


struct GroupResult : Codable, Identifiable {
    //define structure for group result
    public var id: Int
    public var title: String
    public var isPrivate: String
    public var ownerID: Int
    public var category: String
}

/*
sessionID          | int(11)      | NO   | PRI | NULL    | auto_increment |
| ownerID            | int(11)      | NO   | MUL | NULL    |                |
| title              | varchar(64)  | NO   |     | NULL    |                |
| courseCode         | varchar(10)  | YES  |     | NULL    |                |
| sessionDescription | text         | YES  |     | NULL    |                |
| date               | date         | NO   |     | NULL    |                |
| startTime          | time         | NO   |     | NULL    |                |
| endTime            | time         | YES  |     | NULL    |                |
| address            | varchar(128) | NO   |     | NULL    |                |
| room               | varchar(24)  | YES  |     | NULL    |                |
| isPrivate          | varchar(6)   | YES  |     | NULL    |                |
| latitude           | varchar(12)  | YES  |     | NULL    |                |
| longitude          | varchar(12)  | YES  |     | NULL    |
*/

/*
| userID    | int(11)     | NO   | PRI | NULL    | auto_increment |
| userName  | varchar(32) | YES  |     | NULL    |                |
| password  | varchar(32) | YES  |     | NULL    |                |
| firstName | varchar(32) | YES  |     | NULL    |                |
| lastName  | varchar(32) | YES  |     | NULL    |                |
| DOB       | date        | YES  |     | NULL    |                |
| email     | varchar(64) | YES  |     | NULL    |                |
| phone     | varchar(14) | YES  |     | NULL    |                |
| bio       | text        | YES  |     | NULL    |
*/

/*
 | groupID   | int(11)     | NO   | PRI | NULL    | auto_increment |
 | title     | varchar(64) | YES  |     | NULL    |                |
 | isPrivate | tinyint(1)  | YES  |     | NULL    |                |
 | ownerID   | int(11)     | YES  |     | NULL    | 
 */




/*
 //
 //  SessionRetrieve.swift
 //  WeStudy
 //
 //  Created by Nzube Afoaku on 3/12/20-4/19/20.
 //  Copyright © 2020 Fifty. All rights reserved.
 //
 import Foundation
 import SwiftUI
 import MapKit


 // user's input from SearchBar.swift
 struct UserQuery : Hashable, Codable {
     public var userQuery: String;
 }

 struct Category : Hashable, Codable {
     // designate result type (user, session, group)
     public var type: Category

     enum Category: String, Hashable, Codable {
         case users = "user"
         case groups = "group"
         case sessions = "session"
     }
 }

 // all search results
 struct SessionResult: Codable, Hashable {
     // foundation for SessionResult: Sessions.swift by Khalea Berry

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
     public var category: String
     public var error: String
     public var message: String
     
 //    init(sessionID: Int, ownerID: Int, title: String, courseCode: String, description: String, date: String, startTime: String, endTime: String, address: String, room: String, isPrivate: String, latitude: String, longitude: String, category: String, error: String, message: String) {
 //        self.sessionID = sessionID; self.ownerID = ownerID; self.title = title; self.courseCode = courseCode; self.description = description; self.date = date; self.startTime = startTime; self.endTime = endTime; self.address = address; self.room = room; self.isPrivate = isPrivate; self.longitude = longitude; self.latitude = latitude; self.error = error; self.category = category; self.message = message
 //    }
     
 }


 struct UserResult: Codable, Identifiable, Hashable {
     //define structure for user result
     public var id: Int
     public var userName: String
     public var firstName: String
     public var lastName: String
     public var email: String
     public var phone: String
     public var bio: String
     public var category: String
     public var error: String
     public var message: String
 }


 struct GroupResult: Codable, Identifiable, Hashable {
     //define structure for group result
     public var id: Int
     public var title: String
     public var isPrivate: String
     public var ownerID: Int
     public var category: String
     public var error: String
     public var message: String
 }


 class FetchSearchResults: ObservableObject {

 //@Published var sessionResult: [SessionResult] = [
 //    .init(id: 1, firstName: "first", lastName: "last", title: "title", courseCode: "course", description: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room: "room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x"),
 //    .init(id: 2, firstName: "first", lastName: "last", title: "title", courseCode: "course", description: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room: "room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x"),
 //    .init(id: 3, firstName: "first", lastName: "last", title: "title", courseCode: "course", description: "session", date: "date", startTime: "12:00", endTime: "12:00", address: "address", room:"room", isPrivate: "false", latitude: "0000000", longitude: "000000", error: "false", message: "x")
 //]

     
     @Published var sessionResults: [SessionResult]
     
         var userQuery = ""

         init(userQuery: String) {
             
             self.userQuery = userQuery
             
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
                                 self.sessionResults = decodedData
                                 print(self.sessionResults)
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



 /*
 sessionID          | int(11)      | NO   | PRI | NULL    | auto_increment |
 | ownerID            | int(11)      | NO   | MUL | NULL    |                |
 | title              | varchar(64)  | NO   |     | NULL    |                |
 | courseCode         | varchar(10)  | YES  |     | NULL    |                |
 | sessionDescription | text         | YES  |     | NULL    |                |
 | date               | date         | NO   |     | NULL    |                |
 | startTime          | time         | NO   |     | NULL    |                |
 | endTime            | time         | YES  |     | NULL    |                |
 | address            | varchar(128) | NO   |     | NULL    |                |
 | room               | varchar(24)  | YES  |     | NULL    |                |
 | isPrivate          | varchar(6)   | YES  |     | NULL    |                |
 | latitude           | varchar(12)  | YES  |     | NULL    |                |
 | longitude          | varchar(12)  | YES  |     | NULL    |
 */

 /*
 | userID    | int(11)     | NO   | PRI | NULL    | auto_increment |
 | userName  | varchar(32) | YES  |     | NULL    |                |
 | password  | varchar(32) | YES  |     | NULL    |                |
 | firstName | varchar(32) | YES  |     | NULL    |                |
 | lastName  | varchar(32) | YES  |     | NULL    |                |
 | DOB       | date        | YES  |     | NULL    |                |
 | email     | varchar(64) | YES  |     | NULL    |                |
 | phone     | varchar(14) | YES  |     | NULL    |                |
 | bio       | text        | YES  |     | NULL    |
 */

 /*
  | groupID   | int(11)     | NO   | PRI | NULL    | auto_increment |
  | title     | varchar(64) | YES  |     | NULL    |                |
  | isPrivate | tinyint(1)  | YES  |     | NULL    |                |
  | ownerID   | int(11)     | YES  |     | NULL    |
  */

*/
