//
//  SessionDetailView.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/6/20.
//  Copyright © 2020 Fifty. All rights reserved.
//


import SwiftUI
//TODO
//add number of people to the group
//remove hardcoding from function


struct JoinedSessionDetail: View {
    
    var id: Int
    var courseCode: String
    var firstName: String
    var lastName: String
    var date: String //convert date format
    var startTime: String //convert time format
    var endTime: String
    var address: String
    var room: String
    var sessionDescription: String
    var latitude: String
    var longitude: String
    var title: String
    var isPrivate: String

    var formatter = DataCleaning()
    
    var fullName: String{
         var name = ""
           name = firstName + " " + lastName
         return name
        }
    
    //alert
    @State private var showAlert = false
    @State private var confirmationMessage: String = ""
    
    //server response
    
    
    //function to leave session
    func leaveSession() {
        
        struct Message : Codable {
         var error: Bool
         var message : String
            
        }
        
        //set api url
        guard let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/LeaveSession.php") else { return }
        
        // create url request object
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        
        //add parameters
        let params = "userID=1&sessionID=\(id)";
        
        // add parameters to request body
        request.httpBody = params.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data,
                // print error message if request experiences an error
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                
                // make decoder object
                let decoder = JSONDecoder()
                
                // Decode dataResponse from json object to ServerMessageobject
                let smObject = try decoder.decode(Message.self, from: dataResponse)
                print(smObject.message)
                
                //trigger alert
                self.showAlert = true
                
                if (smObject.error == true) {
                    self.confirmationMessage = "Something went wrong. Please try again."
                }
                
                else {
                    self.confirmationMessage = "Left session successfully."
                }
                
            } catch let parsingError  {
                print("Error", parsingError )
                self.confirmationMessage = "Something went wrong. Please try again."
            }
        }
        task.resume()
    }
    
    //start ui
    var body: some View {
        
        
        VStack{
//            Text(courseCode.uppercased())
//            .font(.title)
//            .fontWeight(.bold)
//
            //create this as a seperate view
            Image("NoSessionsCreated")
            .resizable()
            .frame(width:90,height:90)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            //figure out how to make dynamic
            
             Text(fullName)
             .font(.headline)
             .fontWeight(.bold)
            
            
            VStack{
                
                VStack(alignment:.leading){
                    Text("Session Information")
                    .font(.headline)
                    
                    HStack{
                        Text(formatter.convertDateFormat(inputDate: self.date))
                            .font(.subheadline)
                           
                        Text(" |")
                            .font(.subheadline)
                          
                        Text(formatter.convertTimeFormat(inputTime: self.startTime))
                            .font(.subheadline)
                           
                        Text("-")
                            .font(.subheadline)
                        
                        Text(formatter.convertTimeFormat(inputTime: self.endTime))
                            .font(.subheadline)
                       
                            
                    }
                    .frame(maxWidth: .infinity, alignment:.leading)
                    //.padding([.top, .bottom, .horizontal])

                    //address
                     VStack(alignment:.leading){
                         Text(address.capitalized)
                         .font(.subheadline)
                         .lineLimit(2)
                          .padding(.bottom, 2)
                      
                      //room
                      
                        if !(room.isEmpty) {
                            HStack{
                                Text("Room:")
                                .font(.subheadline)
                                Text(room.capitalized)
                                .font(.subheadline)
                            }
                            .padding(.bottom, 5)
                        }
                      
                      
                     }
                     .frame(maxWidth: .infinity, alignment:.leading)
                     .padding([.bottom])
                    
                    //description
                    VStack(alignment:.leading){
                        Text("Description")
                        .font(.headline)
                            .padding(.bottom, 5)
                    
                        Text(sessionDescription)
                        .font(.subheadline)
                        .lineLimit(3)
                  
                    }
                }
                .padding([.top, .bottom, .horizontal])
                .frame(maxWidth: .infinity)

            
            }
            
           //ADD BUTTON HERE

            Button(action: {self.leaveSession()})
                   {
                                 
                     Text("Leave")
                         .fontWeight(.bold)
                         //.frame(width: 40.0, height: 12.5)
                         .font(.system(size: 14, weight: .semibold))
                         .foregroundColor(Color.white)
                         .padding(5)
                  
                         .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                         .cornerRadius(25)
                                     
                  }
                .alert(isPresented: $showAlert) {
                  // Data successfully added alert
                  Alert(title: Text("Alert"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
                
                }
                .frame(maxWidth: .infinity, alignment:.leading)
                .padding([.bottom, .horizontal])
            
            
          //ADD MAP HERE
          SessionMap(string1: latitude, string2: longitude)
        
        }
        .navigationBarTitle(title)
    }
}

struct JoinedSessionDetail_Previews: PreviewProvider {
    static var previews: some View {
        JoinedSessionDetail(id: 0, courseCode: "courseCode", firstName: "first", lastName: "last",date: "date", startTime: "time", endTime: "endTime", address: "address", room: "room", sessionDescription: "sessionDescription", latitude: "latitude", longitude: "longitude", title: "title", isPrivate: "true")
    }
}
