//
//  EditSessionButton.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/8/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import SwiftUI

struct EditSessionButton: View {
    var Session: CreatedSession
    
    var body: some View {
      NavigationLink(destination: EditSesh(session: Session)) {
             
             Text("Edit")
                 .fontWeight(.bold)
                 .frame(width: 35.0, height: 12.5)
                 .foregroundColor(Color.white)
                 .padding(10)
          
                 .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                 .cornerRadius(25)
                 
         }.isDetailLink(true)
    }
}

struct EditSessionButton_Previews: PreviewProvider {
    static var previews: some View {
        EditSessionButton(Session: CreatedSession.init(id: 1, ownerID: 1, title: "title", courseCode: "courseCode", sessionDescription: "description", date: "date", startTime: "startTime", endTime: "endTime", address: "address", room: "room", isPrivate: "isPrivate", latitude: "latitude", longitude: "longitude"))
    }
}
