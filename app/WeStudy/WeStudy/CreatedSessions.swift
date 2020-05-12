  
//
//  CreatedSessions.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 3/10/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import SwiftUI

struct CreatedSessions: View {
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    @ObservedObject var fetch = FetchCreatedSessions()
    
  
    var body: some View {
                

        VStack{
            
            if !(fetch.sessions.isEmpty){
            
            List(fetch.sessions){ todo in
            
                NavigationLink(destination: CreatedSessionDetail(id: todo.id, courseCode: todo.courseCode, title: todo.title, date: todo.date, startTime: todo.startTime, endTime: todo.endTime, address: todo.address, room: todo.room, sessionDescription: todo.sessionDescription, latitude: todo.latitude, longitude: todo.longitude, isPrivate: todo.isPrivate)){
                
                CreatedSeshCard(session: todo)
            
                }
                
                }
                
            } // and if
            
            else {
                VStack {
                    Image("NoSessionsCreated")
                    Text("No Sessions Created")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
                
       
        }
         .navigationBarTitle(Text("Created Sessions"))
    }
}

struct CreatedSessions_Previews: PreviewProvider {
    static var previews: some View {
        CreatedSessions()
    }
}
