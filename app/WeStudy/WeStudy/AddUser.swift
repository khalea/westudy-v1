//
//  AddUser.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/25/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation

// TODO Add birthday, phone number, biography fields

class AddUser {
    
    // API url
    let serverURL = URL(string: "http://cgi.sice.indiana.edu/~team50/api/AddUser.php")

    
    
    func addUser(firstName: String, lastName: String, email: String, userName: String, passWord: String) {
        
        // Create url request object
        var request = URLRequest(url: serverURL!)
        request.httpMethod = "POST"
        
        // Create parameters — Check db to see what parameters we do need to pass for creating new users
        let parameters = "firstName=\(firstName)&lastName=\(lastName)&email=\(email)&userName=\(userName)&passWord=\(passWord)"
        
        // Add parameters to request body
        request.httpBody = parameters.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        // Start API Call
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data,
            // print error if it occurs
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            
            do {
                // Make Decoder
                let decoder = JSONDecoder()
                
                // Get response if successful?
                
            }
        }
        
        task.resume()
    
    }


}
