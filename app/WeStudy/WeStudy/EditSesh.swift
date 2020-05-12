//
//  EditSesh.swift
//  
//
//  Created by Kiarra Pratchett on 4/13/20.
//

import SwiftUI

struct EditSesh: View {
    
    var session: CreatedSession

    //n stands for new
    @State public var Ntitle = ""
    @State private var NcourseCode: String = ""
    @State private var NsessionDescription: String = ""
    @State private var Ndate = Date()
    @State private var NstartTime = Date()
    @State private var NendTime = Date()
    @State private var Naddress: String = ""
    @State private var Nroom: String = ""
    @State private var NisPrivate = false // toggle state
    
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
    func editSession() {
        
        if (Ntitle.isEmpty) {
            Ntitle = session.title
        } 
        
        if (NcourseCode.isEmpty) {
            NcourseCode = session.courseCode
        }
        
        if (NsessionDescription.isEmpty) {
            NsessionDescription = session.sessionDescription
        }
        
        if (Naddress.isEmpty) {
            Naddress = session.address
        }
        
        if (Naddress.isEmpty) {
            Naddress = session.room
        }
        
       
        
        // Create parameters — Check db to see what parameters we do need to pass for creating new users
        let parameters = "title=\(Ntitle)&courseCode=\(NcourseCode)&sessionDescription=\(NsessionDescription)&sessionID=\(session.id)&address=\(Naddress)&room=\(Nroom)&isPrivate=\(NisPrivate)"
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
                    print(serverResponse)
                    print(serverResponse.message)
                    self.showAlert = true
                    if (serverResponse.error == true) {
                        self.confirmationMessage = "Something went wrong. Please try again."
                    } else {
                        self.confirmationMessage = "Edited session successfully."
                    }
                    
                } catch let error {
                    print("Data Error: \(error)")
                    self.showAlert = true
                    self.confirmationMessage = "Something went wrong. Please try again."
                    
                }
            }
        }.resume()
    } // end of function
    
    //start ui
    var body: some View {
        
        VStack{
            
          Form {
                //session details
                Section(header: Text("Session Details")) {

                  TextField(session.title, text: $Ntitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                  
                  TextField(session.courseCode, text: $NcourseCode)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)

                  TextField(session.sessionDescription, text: $NsessionDescription)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                  }
            
            
                //date and time
                Section(header: Text("Date & Time") ) {
                    DatePicker("Date", selection: $Ndate, in: Date()..., displayedComponents: .date)
                        .labelsHidden()
                    
                    HStack{
                       Text("Start Time:")
                       DatePicker("Time", selection: $NstartTime, displayedComponents: .hourAndMinute)
                           .labelsHidden()
                    }
                   
                    HStack{
                       Text("End Time:")
                       DatePicker("Time", selection: $NendTime, displayedComponents: .hourAndMinute)
                           .labelsHidden()
                    }
                }
                
                
                //location
                Section(header: Text("Location") ) {
                    TextField(session.address, text: $Naddress)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .labelsHidden()
                       .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                   
                   TextField("Room", text: $Nroom)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                       .labelsHidden()
                       .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                    }
            
                
                //session availability
                Section(header: Text("Session Availabilty")) {
                                           
                   Toggle(isOn: $NisPrivate) {
                       Text("Private")
                       }
                       if NisPrivate {
                           Text("This session will be searchable and will appear on the map")
                       } else {
                           Text("This session will not be searchable and wil not appear on the map")
                       }
                }
            
                
                Button(action: {self.editSession()},
                label: {
                    Text("Submit")
                      .font(.system(size: 20))
                      .fontWeight(.bold)
                })

                .frame(width: 100.0, height: 25)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(10)
                .alert(isPresented: $showAlert) {
                      // Data successfully added alert
                      Alert(title: Text("Alert"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
                    
                    }
                
            } //end form
         
        } .navigationBarTitle("Edit Session")
        // end vstack
        
    } //end struct
    
}
struct EditSesh_Previews: PreviewProvider {
    static var previews: some View {
        EditSesh(session: CreatedSession.init(id: 1, ownerID: 1, title: "title", courseCode: "courseCode", sessionDescription: "description", date: "date", startTime: "startTime", endTime: "endTime", address: "address", room: "room", isPrivate: "isPrivate", latitude: "latitude", longitude: "longitude"))
    }
}
