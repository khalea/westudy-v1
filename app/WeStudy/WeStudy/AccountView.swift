//
//  AccountView.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//
import SwiftUI

struct AccountView: View {
    
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    
    
    var body: some View {
      
        //NavigationView {
            VStack {
                VStack{
                    Image("CreateProfile")
                        .padding(.top, 10)
                        .padding(.bottom)
                    Text("\(deleg.firstName) \(deleg.lastName)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                }
                
                List {
                    Section(header: Text("Account Settings")){
                        
                        /*
                        NavigationLink(destination: deleg.homePage){
                            Text("Login Credentials")
                        }*/
                        NavigationLink(destination: ProfileView()){
                            Text("Profile Information")
                        }
                    }
                    
                    Section(header: Text("Your Groups")){
                        
                        NavigationLink(destination: CreatedSessions()){
                            Text("Created Sessions")
                        }
                        
                        
                        NavigationLink(destination: JoinedSessions()){
                            Text("Joined Sessions")
                        }
                    }
                    
                    Section(header: Text("Preferences")){
                        
                        NavigationLink(destination: ListView()){
                            Text("Show List View")
                        }
                        
                    }
                }
                Spacer()
                
                
            }
                
            .navigationBarHidden(false)
            .navigationBarTitle(Text("Account"))
       // }
        
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

