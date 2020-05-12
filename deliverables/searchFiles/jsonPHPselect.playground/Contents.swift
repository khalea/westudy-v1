import UIKit
import Foundation
import CoreLocation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct JoinedSession: Codable {
    public var sessionID: Int
//    public var firstName: String
//    public var lastName: String
    public var title: String
    public var courseCode: String
    public var description: String
    public var date: String
    public var startTime: String
    public var endTime: String
    public var address: String
    public var isPrivate: String
    public var latitude: String
    public var longitude: String
    
    

}

var query = "c"

class FetchJoinedSessions: ObservableObject {
    
     //automatically refresh views after edit
     @Published var sessions = [JoinedSession]()
     
    init() {
        
        //set api url
        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/Search2.php")!
        // 2.
        
        // create url request object
        var request = URLRequest(url: url);
        request.httpMethod = "POST";

        //add parameters
        let postString = "query=\(query)";
        
        // convert parameters to json and add to request body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        //set http request header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([JoinedSession].self, from: todoData)
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
var fetch = FetchJoinedSessions()
print(fetch.sessions)

