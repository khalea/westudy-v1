import UIKit
import Combine

//struct NearbySession: Identifiable, Codable {
//    public var id: Int
//    public var firstName: String
//    public var lastName: String
//    public var title: String
//    public var courseCode: String
//    public var sessionDescription: String
//    public var date: String
//    public var startTime: String
//    public var endTime: String
//    public var address: String
//    public var room: String
//    public var isPrivate: String
//    public var latitude: String
//    public var longitude: String
//    public var error: String
//    public var message: String
//
//
//}
//
//class FetchCreatedSessions: ObservableObject {
//
//    //let objectWillChange = ObservableObjectPublisher()
//
//  // 1.
//  //@Published var sessions = [CreatedSession]()
//
//     //automatically refresh views after edit
//     @Published var nearbySessions = [NearbySession]()
//
//    init() {
//        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/GetNearbySessions.php")!
//        // 2.
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            do {
//                if let todoData = data {
//                    // 3.
//                    let decodedData = try JSONDecoder().decode([NearbySession].self, from: todoData)
//
//
//                    //DispatchQueue.main.async {
//                        self.nearbySessions = decodedData
//                        //print(self.nearbySessions)
//
//                        for session in self.nearbySessions {
//                            print(session.title)
//                        }
//                    //}
//
//                } else {
//                    print("No data")
//                }
//            } catch let jsonErr {
//                print("Error", jsonErr)
//            }
//        }
//        task.resume()
//    }
//}
//
//var fetch = FetchCreatedSessions()
//print(fetch.nearbySessions)

       
//struct AddUserResponse : Codable {
//    var userID: Int
//    var message : String
//    var error : Bool
//
//}
//
//var firstName = "Kay"
//var lastName = "Prat"
//var userEmail = "kayprat@yahoo.com"
//
////send to server
//       let params = "firstName=\(firstName)&lastName=\(lastName)&email=\(userEmail)"
//
//
//       let serverURL = URL(string: "https://cgi.sice.indiana.edu/~team50/database/AddUser.php")
//
//       // Create url request object
//       var request = URLRequest(url: serverURL!)
//       request.httpMethod = "POST"
//
//     request.httpBody = params.data(using: .utf8)
//     request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//        guard let dataResponse = data,
//            // print error message if request experiences an error
//            error == nil else {
//                print(error?.localizedDescription ?? "Response Error")
//                return }
//        do{
//
//            // make decoder object
//            let decoder = JSONDecoder()
//
//            // Decode dataResponse from json object to ServerMessageobject
//            let smObject = try decoder.decode(AddUserResponse.self, from: dataResponse)
//            print(smObject.message)
//
//
//
//        } catch let parsingError  {
//            print("Error", parsingError )
//
//        }
//    }
//    task.resume()

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
        
        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/GetNearbySessions.php")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    
                    let decodedData = try JSONDecoder().decode([JoinedSession].self, from: todoData)
                    DispatchQueue.main.async {
                        self.joinedSessions = decodedData
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


var fetch = FetchJoinedSessions()
print(fetch.joinedSessions)
