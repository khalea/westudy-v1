//
//  Location.swift
//  WeStudy
//
//  Created by Khalea Berry on 3/6/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import Foundation

// TODO
// How to store locations?


struct Location : Codable {
    var address : String = ""
    var room : String = ""
    
    init(addr: String, rm: String) {
        self.address = addr
        self.room = rm
    }
}
