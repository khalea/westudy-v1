//
//  ListView.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/19/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    let deleg = UIApplication.shared.delegate as! AppDelegate
      
    @ObservedObject var fetchNearby = FetchNearbySessions()
    
    var body: some View {
        
        VStack{
                   
                if !(fetchNearby.nearbySessions.isEmpty)
                   
                    {
                   // if body
                       List(fetchNearby.nearbySessions) { session in
                           NavigationLink(destination: SessionDetailView(id: session.id, courseCode: session.courseCode, firstName: session.firstName, lastName: session.lastName, date: session.date, startTime: session.startTime, endTime: session.endTime, address: session.address, room: session.room, sessionDescription: session.sessionDescription, latitude: session.latitude, longitude: session.longitude, title: session.title, isPrivate: session.isPrivate) ) {
                          SessionCard(ns: session)
                       }
                      
                      }
                   }// end if body
                   
                   else {
                       VStack {
                           Image("NoSessionsCreated")
                           Text("No Sessions Nearby")
                               .font(.largeTitle)
                               .fontWeight(.bold)
                       }
                   }
               }
               
              .navigationBarTitle(Text("Sessions Near Me"))
             
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
