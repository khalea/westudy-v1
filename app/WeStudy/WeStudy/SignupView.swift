//
//  SignupView.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/6/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    // TODO
    // Autofill with Google Info
    // Or disable firstname, lastname, email from form
    // Double check password
    
    // Push sign up as sheet onto Onboarding page?
    
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var userName = ""
    @State private var passWord = ""
    
    @State private var showGoodAlert = false
    @State private var showBadAlert = false
    
    
    
    var body: some View {
        
        VStack {
            VStack {
                Text("create account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("CreateProfile")
                TextField("First Name", text: $firstName)
                    .padding(10)
                    .keyboardType(.asciiCapable)
                TextField("Last Name", text: $lastName)
                    .padding(10)
                    .keyboardType(.asciiCapable)
                // keyboard for email input
                TextField("Email", text: $email)
                    .padding(10)
                    .keyboardType(.emailAddress)
                TextField("Username", text: $userName)
                    .padding(10)
                    .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                TextField("Password", text: $passWord)
                    .padding(10)
                    .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
            }.padding(25)
            
            
            // Add user to DB
            
            
            Button(action: {self.sendData()},
                   label: {
                    Text("Sign Up")
                        .font(.system(size: 22))
                        .fontWeight(.bold)})
                
                .frame(width: 300.0, height: 50)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(10)
                .alert(isPresented: $showGoodAlert) {
                    // Data successfully added alert
                    Alert(title: Text("You've signed up."), message: Text("Your user info has been saved!"), dismissButton: .default(Text("Okay!")))}
            .alert(isPresented: $showBadAlert) {
                // Data successfully added alert
                Alert(title: Text("Sign up failed."), message: Text("Try again."), dismissButton: .default(Text("Okay!")))
            }
            
            
            
            
        }
    }
    
    // Data structure for server repsonse
    struct AddUserResponse : Codable {
        var message : String
    }
    
    // Send data to server
    func sendData() {
        
        // Create parameters — Check db to see what parameters we do need to pass for creating new users
        let parameters = "firstName=\(self.firstName)&lastName=\(self.lastName)&email=\(self.email)&userName=\(self.userName)&passWord=\(self.passWord)"
        // API url - http://cgi.sice.indiana.edu/~team50/api/AddUser.php
        let serverURL = URL(string: "https://cgi.sice.indiana.edu/~team50/team-50/database/AddUser.php")
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
                    let serverResponse = try JSONDecoder().decode(AddUserResponse.self, from: data)
                    print(serverResponse)
                    print(serverResponse.message)
                    self.showGoodAlert = true
                    
                } catch let error {
                    print("Data Error: \(error)")
                    self.showBadAlert = true
                }
            }
        }.resume()
        
        
    }
    
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
