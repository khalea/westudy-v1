//
//  SearchField.swift
//  WeStudy
//
//  Created by Khalea Berry on 3/4/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct SearchField: View {
    
    @State private var query: String = "x"
    
    var body: some View {
        
        /*TextField("Enter your name", text: $query)
            .frame(width: 250, height: 100)
            .background(Color.green)
        */
        
        Text("Hi")
        
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
    }
}
