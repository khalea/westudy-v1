//
//  CreatedSeshCard.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 3/11/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import SwiftUI
import Combine


struct CreatedSeshCard: View {
    
    var session: CreatedSession
    
    //functions to format time and date
    var formatter = DataCleaning()
  
   
//    var fullName: String{
//              var name = ""
//                name = js.firstName + " " + js.lastName
//              return name
//          }
    
    var body: some View {
        
        
        VStack(alignment: .leading){

            HStack{
                Image("CreateProfile")
                    .resizable()
                    //figure out how to make dynamic
                    .frame(width:70,height:70)

                
                Text(session.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                
             

            }
             .padding([.top, .horizontal])


            VStack(alignment:.leading){
                HStack{
                    Text(formatter.convertDateFormat(inputDate: session.date))
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" |")
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(formatter.convertTimeFormat(inputTime: session.startTime))
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    Text(" |")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    Text(session.address)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment:.leading)
                .padding([.bottom])


                VStack(alignment:.leading){
                    Text(session.courseCode.uppercased())
                    .font(.headline)
                    .foregroundColor(Color.white)
                    Text(session.sessionDescription)
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(Color.white)
                }
                Divider()
                
                HStack{
                    
                    if Bool(session.isPrivate) ?? false {
                        Image("ClosedLock")
                     } else {
                        Image("OpenLock")
                    }
                    Spacer()
                    Image("PeopleIcon")
                }
            }
            .padding([.bottom, .horizontal])
            .frame(maxWidth: .infinity)


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

struct CreatedSeshCard_Previews: PreviewProvider {
    static var previews: some View {
        CreatedSeshCard(session: CreatedSession.init(id: 1, ownerID: 1, title: "title", courseCode: "courseCode", sessionDescription: "description", date: "date", startTime: "startTime", endTime: "endTime", address: "address", room: "room", isPrivate: "isPrivate", latitude: "latitude", longitude: "longitude"))
    }
}
