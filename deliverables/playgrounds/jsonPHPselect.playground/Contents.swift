import UIKit
import Foundation
import CoreLocation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//struct JoinedSession: Codable {
//    public var sessionID: Int
////    public var firstName: String
////    public var lastName: String
//    public var title: String
//    public var courseCode: String
//    public var description: String
//    public var date: String
//    public var startTime: String
//    public var endTime: String
//    public var address: String
//    public var isPrivate: String
//    public var latitude: String
//    public var longitude: String
//
//
//
//}
//
//var query = "c"
//
//class FetchJoinedSessions: ObservableObject {
//
//     //automatically refresh views after edit
//     @Published var sessions = [JoinedSession]()
//
//    init() {
//
//        //set api url
//        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/Search2.php")!
//        // 2.
//
//        // create url request object
//        var request = URLRequest(url: url);
//        request.httpMethod = "POST";
//
//        //add parameters
//        let postString = "query=\(query)";
//
//        // convert parameters to json and add to request body
//        request.httpBody = postString.data(using: String.Encoding.utf8);
//
//        //set http request header
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            do {
//                if let todoData = data {
//                    // 3.
//                    let decodedData = try JSONDecoder().decode([JoinedSession].self, from: todoData)
//                    DispatchQueue.main.async {
//                        self.sessions = decodedData
//                        print(self.sessions)
//                    }
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
//var fetch = FetchJoinedSessions()
//print(fetch.sessions)


//struct ServerMessage: Codable {
//    var sessionID: Int
//    var ownerID: Int
//    var title: String
//    var courseCode: String
//    var description: String
//    var date: String
//    var startTime: String
//    var endTime: String
//    var address: String
//    var room: String
//    var isPrivate: String
//    var latitude: String
//    var longitude: String
//}
//
//class PostSession: ObservableObject {
//
//    //add session to database
//    func fetchSession(query: String) {
//
//        //set api url
//        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/Search2.php")!
//
//        // create url request object
//        var request = URLRequest(url: url);
//        request.httpMethod = "POST";
//
//        //add parameters
//        let postString = "query=\(query)";
//
//        // convert parameters to json and add to request body
//        request.httpBody = postString.data(using: String.Encoding.utf8);
//
//        //set http request header
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//         // start API call
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let dataResponse = data,
//                // print error message if request experiences an error
//                error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return }
//            do{
//
//                // make decoder object
//                let decoder = JSONDecoder()
//
//                // Decode dataResponse from json object to ServerMessageobject
//                let smObject = try decoder.decode(ServerMessage.self, from: dataResponse)
//                print(smObject)
//
//
//            } catch let jsonErr {
//                print("Error", jsonErr)
//            }
//        }
//        task.resume()
//    }
//
//}

struct User : Codable, Identifiable {
    
    var id: Int
    var firstName : String
    var lastName : String
    var userName : String
    var email : String
    var bio : String
    var phone : String
    //var birthday :
    
}

class FetchCurrentUser: ObservableObject {
    
    var userID = 1;
    
    @Published var user: [User] = [
        User.init(id: 1, firstName: "first", lastName: "last", userName: "user", email: "email", bio: "bio", phone: "phone")]

    
    init() {

           //set api url
           let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/CurrentUser.php")!
           // 2.

           // create url request object
           var request = URLRequest(url: url);
           request.httpMethod = "POST";

           //add parameters
           let postString = "userID=\(userID)";

           // convert parameters to json and add to request body
           request.httpBody = postString.data(using: String.Encoding.utf8);

           //set http request header
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")

          
               
               
               let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                   do {
                       if let todoData = data {
                           
                           let decodedData = try JSONDecoder().decode(Array<User>.self, from: todoData)
                        
                           DispatchQueue.main.async {
                               self.user = decodedData
                            
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

var fetch = FetchCurrentUser()
print(fetch.user[0])
