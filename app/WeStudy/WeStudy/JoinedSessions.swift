
  // JoinedSessions.swift
  // WeStudy

 // Created by Kiarra Pratchett on 3/11/20.
  // Copyright © 2020 Fifty. All rights reserved.

import SwiftUI

struct JoinedSessions: View {
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    @ObservedObject var fetchjs = FetchJoinedSessions()

   
    
    var body: some View {
        
        VStack{
            
            if !(fetchjs.joinedSessions.isEmpty)
            
             {
            // if body
                List(fetchjs.joinedSessions) { session in
                    NavigationLink(destination: JoinedSessionDetail(id: session.id, courseCode: session.courseCode, firstName: session.firstName, lastName: session.lastName, date: session.date, startTime: session.startTime, endTime: session.endTime, address: session.address, room: session.room, sessionDescription: session.sessionDescription, latitude: session.latitude, longitude: session.longitude, title: session.title, isPrivate: session.isPrivate) ) {
                   JoinedSeshCard(js: session)
                }
               
               }
            }// end if body
            
            else {
                VStack {
                    Image("NoSessionsCreated")
                    Text("No Sessions Joined")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
        }
        
       .navigationBarTitle(Text("Joined Sessions"))

        }
    
}

struct JoinedSessions_Previews: PreviewProvider {
    static var previews: some View {
        JoinedSessions()
    }
}



