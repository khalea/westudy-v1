//
//  SwiftUIView.swift
//  WeStudy
//
//  Created by Khalea Berry on 3/3/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct SignUpBtn: View {
    
    @State var showSignUp = false
    
    var body: some View {
        
        Button(action: {self.showSignUp.toggle()}) {
            Text("Sign Up")
                //.font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 180.0, height: 50)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .foregroundColor(Color.white)
            .cornerRadius(10)
        }
        .sheet(isPresented: $showSignUp) {
            SignupView()
        }
        
    }
}

struct SignUpBtn_Previews: PreviewProvider {
    static var previews: some View {
        SignUpBtn()
    }
}
