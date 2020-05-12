//
//  SessionRetrieve.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 3/12/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import MapKit


// foundation: Sessions.swift by Khalea Berry - using same structures for consistency
struct SearchResults : Hashable, Decodable {
    
    //define structure for session result
    public var sid: Int
    public var title: String
    public var courseCode: String
    public var description: String
    public var time: String
    public var owner: String
    public var address: String
    public var room: String
    
    //define structure for user result
    public var uid: Int
    public var userName: String
    public var firstName: String
    public var lastName: String
    public var bio: String
    public var email: String
    public var phone: String
    
    //define structure for group result
    public var gid: Int
    public var gTitle: String
    public var ownerID: Int
    
    // designate result type (user, session, group)
    public var type: Category

    enum Category: String, Hashable, Decodable {
        case users = "user"
        case groups = "group"
        case sessions = "session"
    }
    
}
