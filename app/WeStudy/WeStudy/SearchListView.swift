//
//  SearchListView.swift (orig. ListView.swift)
//  WeStudy
//
//  Created by Nzube Afoaku on 3/10/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

// create Sess for use in UI
//  (sessionID,attendees,title,courseCode,description,date,time,address,room,isPrivate)

struct Sess: Hashable, Codable{
    var sid: Int
    var title: String
    var courseCode: String
    var description: String
    var time: Date
}

// (groupID,title,isPrivate,ownerID) INSERT INTO groups (title,isPrivate,ownerID) VALUES ();

struct Grp: Hashable, Codable {
    var gid: Int
    var title: String
    var isPrivate: String
    var ownerID: Int
}

// results of query in an array - hard coded at the moment
struct SearchListView: View {
    
    // navigate back to map and search
    //let deleg = UIApplication.shared.delegate as! AppDelegate

    
    
    var sessRes = [
        Sess(sid: 1, title: "Infinite Finite", courseCode: "MATH-M 118", description: "Regular sessions with small break out groups", time: Date()),
        Sess(sid: 2, title: "Poetry Nerds", courseCode: "ENG-L 205", description: "Building skills in poetry analysis", time: Date())
    ]
    

    var body: some View {
        // page title + number of results
        VStack {
            SearchBar()
            NavigationView {
                List(sessRes, id: \.sid) {session in ResultRow(session: session)
                }
            }
        }
    }
}

// formatting for each row of results
struct ResultRow: View {
    var session: Sess
    let dateFormat = DateFormatter()
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(session.title)
                    .font(.title)
                Text(session.courseCode)
                    .font(.body)
                Text(session.description)
                    .font(.caption)
                Spacer()
                //Text(dateFormat.string(from: session.time))
            }
            
        }
    }
}



// preview
struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}

// count number of results and send count to .navigationBarTitle
func listCount (_ sessRes:[Array<Any>])-> Int {
    var count = 0
    for _ in sessRes {
        count += 1
    }
    return count
}
