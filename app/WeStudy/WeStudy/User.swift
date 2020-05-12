//
//  User.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/27/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation

struct User : Codable, Identifiable {
    var id: Int
    var firstName : String
    var lastName : String
    var userName: String
    //var email : String
    var bio : String
    var phone : String
    //var birthday : Date
    
}

class FetchCurrentUser: ObservableObject {
    
    var userID = 1;
       
       @Published var user: [User] = [
           User.init(id: 1, firstName: "first", lastName: "last", userName: "user", bio: "bio", phone: "phone")]

       
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
