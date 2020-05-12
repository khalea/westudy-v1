//
//  AuthButtons.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct AuthButton: View {
    
   
    
    var body: some View {
        
        HStack {
            
            NavigationLink(destination: LoginView()) {
                
                Button(action: {
                    attemptGoogleAuth()
                }) {
                    Text("Sign in with Google")
                        //.font(.system(size: 16))
                        .fontWeight(.bold)
                }
                .frame(width: 180.0, height: 50)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .foregroundColor(Color.white)
            }
            .cornerRadius(10)
        
        }
        
    }
}


func attemptGoogleAuth() {
    
    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
    GIDSignIn.sharedInstance()?.signIn()
    
    // Navigate to next view
    // let deleg = UIApplication.shared.delegate as! AppDelegate
    // deleg.homePage
    
}

struct AuthButtons_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton()
    }
}
