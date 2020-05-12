//
//  CreateSession.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 1/28/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct CreateSession: View {
    
    @State private var courseTitle: String = ""
    @State private var sessionDescription: String = ""
    @State private var date: String = ""
    @State private var time: String = ""
    @State private var address: String = ""
    @State private var room: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing:10)  {
                Section {
                    Image("CreateSession")
                }
                Section {
                    TextField("Course Title", text: $courseTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                         .padding(10)
                }
            
                
                Section {
                    TextField("Session Description", text: $sessionDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                }
                
                Section {
                    TextField("Date", text: $date)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                               }
                Section {
                    TextField("Time", text: $time)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                               }
                Section {
                    TextField("Address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                               }
                Section {
                TextField("Room", text: $room)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                           }

                Section {
                    Button(action: {
                        print("Create")
                    }) {
                        Text("Create Session")
                            .fontWeight(.semibold)
                            .font(.title)
                        
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(20)
                    }
<<<<<<< HEAD
                    
                   
                    } //end form
            
                
                
                Button(action: {
                    self.manager.postSession(courseTitle: self.courseTitle, sessionDescription: self.sessionDescription, date: self.date, time: self.time, address: self.address, room: self.room, isPrivate: self.isPrivate)
                        })
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
                }
        
            .navigationBarHidden(false)
            .navigationBarTitle(Text("Create Session"))
            .navigationBarItems(leading:
                Button(action: {
                    print("Back button pressed...")
                }) {
                    Text("⟵")
                    .font(.system(size: 36))
                    .padding(.bottom)
=======
>>>>>>> origin/master
                }
            }
        .navigationBarTitle(Text("Create a Session"))
        }
  }
}

struct CreateSession_Previews: PreviewProvider {
    static var previews: some View {
        CreateSession()
    }
}
