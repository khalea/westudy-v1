import UIKit

var userID = 1
var sessionID = 104
//codable struct used to decode the server response into json
struct ServerMessage: Identifiable, Codable {
    var error: Bool
    var id: String {
        return message
    }
    let message: String
}

let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/JoinSession.php")

// create url request object
var request = URLRequest(url: url!);
request.httpMethod = "POST";


// create parameters
let params = "userID=\(userID)&sessionID=\(sessionID)"

// add parameters to request body
request.httpBody = params.data(using: .utf8)
request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

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
       
       // Decode dataResponse from json object to MagicNumber object
       let mnObject = try decoder.decode(ServerMessage.self, from: dataResponse)
       
       // set text field in the UI to contain message and status values contained in mnObject
       print(mnObject.message)
       
   } catch let parsingError {
       print("Error", parsingError)
   }
}
task.resume()
