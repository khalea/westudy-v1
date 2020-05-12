//
//  CreatedSessionDetail.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/13/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct CreatedSessionDetail: View {
    var id: Int
    var courseCode: String
    var title: String
    var date: String //convert date format
    var startTime: String //convert time format
    var endTime: String
    var address: String
    var room: String
    var sessionDescription: String
    var latitude: String
    var longitude: String
    var isPrivate: String
    
    //convert time string to am/pm format
    var formatter = DataCleaning()
    
    var body: some View {
        
       VStack{
//           Text(courseCode.uppercased())
//                .font(.title)
//                .fontWeight(.bold)
           
           //create this as a seperate view
           Image("CreateProfile")
           .resizable()
           .frame(width:90,height:90)
           .clipShape(Circle())
           .overlay(Circle().stroke(Color.white, lineWidth: 4))
           .shadow(radius: 10)
        
           
           //figure out how to make dynamic
           Text(courseCode.uppercased())
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
                   .padding([.bottom], 2)

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
                 
                   }
               }
               .padding([.top, .bottom, .horizontal])
               .frame(maxWidth: .infinity)

           
           }
          //ADD BUTTON HERE
           VStack(alignment:.leading){
            EditSessionButton(Session: CreatedSession.init(id: id, ownerID: 1, title: title, courseCode: courseCode, sessionDescription: sessionDescription, date: date, startTime: startTime, endTime: endTime, address: address, room: room, isPrivate: isPrivate, latitude: latitude, longitude: longitude))
           }
               .frame(maxWidth: .infinity, alignment:.leading)
               .padding([.bottom, .horizontal])
          
               
         //ADD MAP HERE
         SessionMap(string1: latitude, string2: longitude)
       }
       .navigationBarTitle(title)
                
    }
    
}

struct CreatedSessionDetail_Previews: PreviewProvider {
    static var previews: some View {
        CreatedSessionDetail(id: 1, courseCode: "courseCode", title: "title", date: "date", startTime: "time", endTime: "endTime", address: "address", room: "room", sessionDescription: "sessionDescription", latitude: "latitude", longitude: "longitude", isPrivate: "false")
    }
}
