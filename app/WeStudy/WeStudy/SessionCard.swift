//
//  SessionCard.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/19/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct SessionCard: View {
    //js short for joined session
    var ns: JoinedSession
     
    //functions to format time and date
    var formatter = DataCleaning()
  
    var fullName: String{
             var name = ""
               name = ns.firstName + " " + ns.lastName
             return name
         }
    
    var body: some View {
        
     VStack(alignment: .leading){

           HStack{
               Image("NoSessionsCreated")
                   .resizable()
                   //figure out how to make dynamic
                   .frame(width:60,height:60)

               
               Text(fullName)
                   .font(.headline)
                   .foregroundColor(Color.white)
               
            

           }
            .padding([.top, .horizontal])


           VStack(alignment:.leading){
            
             HStack{
                    Text(formatter.convertDateFormat(inputDate: ns.date ?? "00-00-0000"))
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" |")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(formatter.convertTimeFormat(inputTime: ns.startTime ?? "00:00:00"))
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" |")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    Text(ns.address)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                }
                   .frame(maxWidth: .infinity, alignment:.leading)
                   .padding([.bottom])


               VStack(alignment:.leading){
                   Text(ns.courseCode.uppercased())
                   .font(.headline)
                   .foregroundColor(Color.white)
                   Text(ns.sessionDescription)
                   .font(.subheadline)
                   .lineLimit(3)
                   .foregroundColor(Color.white)
                }
           }
               .padding([.top, .horizontal])
               .frame(maxWidth: .infinity)

           Divider()
           
           HStack{
               if Bool(ns.isPrivate) ?? false {
                   Image("ClosedLock")
                } else {
                   Image("OpenLock")
               }
               Spacer()
               Image("PeopleIcon")
            }
               //.frame(maxWidth: .infinity, alignment:.trailing)
               .padding([.bottom, .horizontal])
           
            }

               .background(Color(red: 112.0/255, green: 112.0/255, blue: 112.0/255))
               .frame(maxWidth: .infinity)
               .cornerRadius(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(Color(red: 112/255, green: 112/255, blue: 112/255), lineWidth: 1)
               )

               .padding([.top, .horizontal])

           }
}

struct SessionCard_Previews: PreviewProvider {
    static var previews: some View {
        SessionCard(ns: JoinedSession.init(id: 1, firstName: "first", lastName: "last", title: "title", courseCode: "courseCode", sessionDescription: "description", date: "date", startTime: "startTime", endTime: "endTime", address: "address", room: "room", isPrivate: "isPrivate", latitude: "latitude", longitude: "longitude", error: "false", message: "x"))
    }
}
