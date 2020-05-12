//
//  Onboard.swift
//  WeStudy
//
//  Created by Khalea Berry on 1/21/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import GoogleSignIn

// Ref for sign in
// https://developers.google.com/identity/sign-in/ios/sign-in?ver=swift

// TODO
// Push sign up as sheet onto Onboarding page?


struct Onboard: View {
    
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    @State var signedIn = false
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                Image("GraduationCap")
                //Spacer()
                Text("Welcome to Westudy!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                //Spacer()
                
                VStack {
                    AuthButton()
                        .padding(5)
                        .padding(.top, 10)
//                    SignUpBtn()
//                        .padding(5)
//                    LogInBtn()
//                        .padding(5)
                    LoggedInBtn()
                        .padding(5)
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            
            GIDSignIn.sharedInstance()?.presentingViewController = self.body as? UIViewController
            
            // Automatically sign in user
            // GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        }
    }
}



struct Onboard_Previews: PreviewProvider {
    static var previews: some View {
        Onboard()
    }
}
