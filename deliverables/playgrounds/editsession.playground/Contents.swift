import UIKit

var Ntitle: String = ""
var NcourseCode: String = ""
var NsessionDescription: String = ""

var title = "Best Group Ever"
var courseCode = "INFO-I101"
var sessionDescription = "Testing edit button"

struct ServerResponse: Codable {
       var error: Bool
       var message : String
   }

if (Ntitle.isEmpty) {
          Ntitle = title
      }
      
if (NcourseCode.isEmpty) {
  NcourseCode = courseCode
}
      
if (NsessionDescription.isEmpty) {
  NsessionDescription = sessionDescription
}

// Create parameters — Check db to see what parameters we do need to pass for creating new users
let parameters = "title=\(Ntitle)&courseCode=\(NcourseCode)&sessionDescription=\(NsessionDescription)&sessionID=102"
print(parameters)

let serverURL = URL(string: "http://cgi.sice.indiana.edu/~team50/database/EditSession.php")

// Create url request object
var request = URLRequest(url: serverURL!)
request.httpMethod = "POST"

// Add parameters to request body
request.httpBody = parameters.data(using: .utf8)
request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

// Create data task
URLSession.shared.dataTask(with: request) { data, response, error in

if (error != nil) {
    print("Connection Error: \(String(describing: error))")
}

// Check response code
if let responseCode = response as? HTTPURLResponse {
    let code = responseCode.statusCode
    print("Status: \(code)")
}

// Data
// TODO add server messages for alerts
if let data = data {
    do {
        let serverResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
    
        print(serverResponse.message)
     
//        if (serverResponse.error == true) {
//            self.confirmationMessage = "Something went wrong. Please try again."
//        } else {
//            self.confirmationMessage = "Edited session successfully."
//        }
        
    } catch let error {
        print("Data Error: \(error)")
//        self.showAlert = true
//        self.confirmationMessage = "Edited session successfully."
        
    }
}
}.resume()
