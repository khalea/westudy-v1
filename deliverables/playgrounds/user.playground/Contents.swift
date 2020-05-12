import UIKit

struct User : Codable, Identifiable {
  
    var id: Int
    var userName: String
    var firstName: String
    var lastName: String
    var email: String
    var bio: String
    var phone: String
}

//// 1.
//var userID = 1
//
//var users = [User]()
//
////set api url
//let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/CurrentUser.php")!
//
//// create url request object
//var request = URLRequest(url: url);
//request.httpMethod = "POST";
//
////add parameters
//let params = "userID=\(userID)";
//
//// add parameters to request body
//request.httpBody = params.data(using: .utf8)
//request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//  guard let dataResponse = data,
//      // print error message if request experiences an error
//      error == nil else {
//          print(error?.localizedDescription ?? "Response Error")
//          return }
//  do{
//
//      // make decoder object
//      let decoder = JSONDecoder()
//
//      // Decode dataResponse from json object to ServerMessageobject
//      let smObject = try decoder.decode(Array<User>.self, from: dataResponse)
//      print(smObject)
//      print(users.first?.email)
//
//  } catch let parsingError  {
//      print("Error", parsingError )
//  }
//}
//task.resume()
  



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
  // 1.
  @Published var sessions = [CreatedSession]()
     
    init() {
        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/GetCreatedSessions.php")!
        // 2.
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode(Array<CreatedSession>.self, from: todoData)
                    DispatchQueue.main.async {
                        self.sessions = decodedData
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

var fetch = FetchCreatedSessions()

print(fetch.sessions)
