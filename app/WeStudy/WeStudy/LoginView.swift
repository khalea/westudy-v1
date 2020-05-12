//
//  LoginView.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/6/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    // let deleg = UIApplication.shared.delegate as! AppDelegate
    
    @State private var userName = ""
    @State private var passWord = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("log in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("Login")
                TextField("Username", text: $userName)
                    .padding(10)
                    .keyboardType(.asciiCapable)
                TextField("Password", text: $userName)
                    .padding(10)
                    .keyboardType(.asciiCapable)
                
            }.padding(25)
            
            
            ToHome()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
