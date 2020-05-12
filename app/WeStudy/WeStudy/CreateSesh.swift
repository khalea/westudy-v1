//
//  CreateSesh.swift
//  WeStudy
//
//  Created by Khalea Berry on 3/6/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import SwiftUI
import MapKit

struct CreateSesh: View {
    //TODO
    //REMOVE HARD CODING
   
    //ADD SUCCESS OR FAIL TEXT
 
    //AUTOFILL ADDRESS
 
    //MAKE SURE THAT END TIME IS AFTER START TIME
    
    
    
    //navigation button
     let deleg = UIApplication.shared.delegate as! AppDelegate
         
     @State private var sessionTitle: String = ""
     @State private var courseCode: String = ""
     @State private var sessionDescription: String = ""
     @State private var date = Date()
     @State private var startTime = Date()
     @State private var endTime = Date()
     @State private var address: String = ""
     @State private var room: String = ""
     @State private var isPrivate = false // toggle state
     @State private var showAlert = false
     @State private var confirmationMessage = ""
    
    //create session function
    func sendSession(){
        
        struct ServerResponse {
            var error: Bool
            var message: String
        }
        
        let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/insertsession.php/")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //convert date to date string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: date)
        
        //convert time to time string
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let strTime1 = timeFormatter.string(from: startTime)
        let strTime2 = timeFormatter.string(from: endTime)

        //convert address to lat/long
        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(address){ (placemarks, error) in
           if error == nil {
               if let placemark = placemarks?[0] {
                   let location = placemark.location!
                   //print(location.coordinate)
                    var lat = ""
                    var long = ""
                
                   lat = String(location.coordinate.latitude)
                   long = String(location.coordinate.longitude)  
                
                   //set parameters
                let postString = "ownerID=\(1)&title=\(self.sessionTitle)&sessionDescription=\(self.sessionDescription)&date=\(strDate)&startTime=\(strTime1)&endTime=\(strTime2)&address=\(self.address)&room=\(self.room)&courseCode=\(self.courseCode)&isPrivate=\(self.isPrivate)&latitude=\(lat)&longitude=\(long)"
                          
            
                   //add parameters to api request
                   request.httpBody = postString.data(using: String.Encoding.utf8);
                
                   //send request
                   let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                       if let error = error {
                           print("error:", error)
                           return
                       }

                       do {
                           guard let data = data else { return }
                           guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? ServerResponse else { return }
                           print("json:", json)
                        
                            //alert
                            self.showAlert = true
                            if (json.error == true) {
                                self.confirmationMessage = "Something went wrong. Please try again."
                            } else {
                                self.confirmationMessage = "Created session successfully."
                            }
                       } catch {
                          self.confirmationMessage = "Something went wrong. Please try again."
                           print("error:", error)
                       }
                   }

                   task.resume()
               }
           }
           else {
             print("Some error occurred")
           }
        }
        
        
        
        
        
    }
    
    //validates form to check for empty fields
     var disableForm: Bool {
        sessionTitle.count < 5 || address.count < 20 || courseCode.count < 5
     }
  
     
      
    //date picker
     var dateFormatter: DateFormatter {
           let formatterD = DateFormatter()
           formatterD.dateStyle = .long
           return formatterD
       }
    
    //time picker
    var timeFormatter: DateFormatter {
          let formatterT = DateFormatter()
          formatterT.dateStyle = .short
          return formatterT
      }

    
    //START UI
     var body: some View {
        NavigationView{
             VStack{
                 Image("CreateSession")
             
                 Form{
                    
                    Section(header: Text("Session Details")) {
                        TextField("Group Name", text: $sessionTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                  
                         TextField("Course Code (ex. CSCI-C291)", text: $courseCode)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)

                         TextField("Session Description", text: $sessionDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                    }
                    
                    Section(header: Text("Date & Time") ) {
                         DatePicker("Date", selection: $date, in: Date()..., displayedComponents: .date)
                             .labelsHidden()
                        HStack{
                        Text("Start Time:")
                        DatePicker("Time", selection: $startTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        }
                        
                        HStack{
                        Text("End Time:")
                        DatePicker("Time", selection: $endTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        }
                     }
                 

                    Section(header: Text("Location") ){
                         TextField("Address (street, city, state, zip)", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .labelsHidden()
                            .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                        
                        TextField("Room", text: $room)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .labelsHidden()
                            .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                     }
                 
             
                        
                     Section(header: Text("Session Availabilty")) {
                            
                        Toggle(isOn: $isPrivate) {
                            Text("Private")
                            }
                            if isPrivate {
                                Text("This session will be searchable and will appear on the map")
                            } else {
                                Text("This session will not be searchable and wil not appear on the map")
                            }
                      }
                    
                    
                    
                    
                    //button
                    Button(action: { self.sendSession() })
                          {
                            Text("Create")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                           }
                             .foregroundColor(Color.white)
                             .padding()
                             .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                             .cornerRadius(10)
                             .frame(minWidth: 10, maxWidth: .infinity)
                             .alert(isPresented: $showAlert) {
                                Alert(title: Text("Confirmation"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
                                }
                 }
                
                }.disabled(disableForm) //end form
             
         
             .navigationBarHidden(false)
             .navigationBarTitle(Text("Create Session"), displayMode: .large)
            
             
         }
      }
    }


struct CreateSesh_Previews: PreviewProvider {
    static var previews: some View {
        CreateSesh()
    }
}

