//
//  EditProfileView.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/19/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct EditProfileView: View {
    
       var fetch = FetchCurrentUser()
    
//        var user = fetch.user[0]
    
      var user: User
    
       var userID = 1
        
       @State private var NfName: String = ""
       @State private var NlName: String = ""
       @State private var Nusername: String = ""
       @State private var Nbio: String = ""
       
    
      //alert
      @State private var showAlert = false
      @State private var confirmationMessage: String = ""
      
    
    
       //send data to database
       // Data structure for server repsonse
       struct ServerResponse : Codable {
           var error: Bool
           var message : String
       }
       
       // Send data to server
       func editProfile() {
           
           if (NfName.isEmpty) {
            NfName = user.firstName
           }
           
           if (NlName.isEmpty) {
            NlName = user.lastName
           }
           
           if (Nusername.isEmpty) {
            Nusername = user.userName
           }
           
           if (Nbio.isEmpty) {
            Nbio = user.bio
           }
           
          
          
           
           // Create parameters — Check db to see what parameters we do need to pass for creating new users
           let parameters = "firstName\(NfName)&lastName=\(NlName)&userName=\(Nusername)&bio=\(Nbio)&userID=\(userID)"
           print(parameters)
           
           let serverURL = URL(string: "http://cgi.sice.indiana.edu/~team50/database/EditProfile.php")
           
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
                       print(serverResponse)
                       print(serverResponse.message)
                       self.showAlert = true
                       if (serverResponse.error == true) {
                           self.confirmationMessage = "Something went wrong. Please try again."
                       } else {
                           self.confirmationMessage = "Edited profile successfully."
                       }
                       
                   } catch let error {
                       print("Data Error: \(error)")
                       self.showAlert = true
                       self.confirmationMessage = "Something went wrong. Please try again."
                       
                   }
               }
           }.resume()
       }
    
    //disable form
    var disableForm: Bool {
        NfName.isEmpty && NlName.isEmpty && Nusername.isEmpty && Nbio.isEmpty
        }
    var body: some View {
        
        
        
        VStack{
           TextField("First Name", text: $NfName)
           .textFieldStyle(RoundedBorderTextFieldStyle())
               .padding(10)
            
           TextField("Last Name", text: $NlName)
           .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
           
           TextField("Username", text: $Nusername)
           .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
           
           TextField("Bio", text: $Nbio)
           .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            
            Button(action: {self.editProfile()},
            label: {
                Text("Submit")
                  .font(.system(size: 20))
                  .fontWeight(.bold)
                }).disabled(disableForm)

            .frame(width: 100.0, height: 25)
            .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding(10)
            .alert(isPresented: $showAlert) {
                  // Data successfully added alert
                  Alert(title: Text("Alert"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
                
                }
            }
            .padding(.horizontal, 10)
            .navigationBarTitle("Edit Profile")
           }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.init(id: 1, firstName: "first", lastName: "last", userName: "userName", bio: "bio", phone: "phone"))
    }
}
