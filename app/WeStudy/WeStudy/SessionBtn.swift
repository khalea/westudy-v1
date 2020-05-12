//
//  SessionBtn.swift
//  WeStudy
//
//  Created by Khalea Berry on 3/3/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct SessionBtn: View {
    
    @State var showCreateSesh = false
    
    var body: some View {
        
        Button(action: {self.showCreateSesh.toggle()}) {
            Text("+")
                .foregroundColor(.white)
                .padding()
        }
        .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
        .clipShape(Circle())
        .shadow(radius: 5)
        .sheet(isPresented: $showCreateSesh) {
            CreateSesh()
        }
    }
}

struct SessionBtn_Previews: PreviewProvider {
    static var previews: some View {
        SessionBtn()
    }
}
