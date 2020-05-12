//
//  ProfileView.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/15/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    let deleg = UIApplication.shared.delegate as! AppDelegate
    var fetch = FetchCurrentUser()
    
    var body: some View {
        
        VStack {
            VStack{
                Image("CreateProfile")
                
                Text("\(deleg.firstName) \(deleg.lastName)")
                    .fontWeight(.bold)
                    .font(.title)
                
                Text("Indiana University")
                }
            .padding([.bottom], 10)
        
          //button
            EditProfileButton(user: fetch.user[0])
            
            //bio
            VStack (alignment:.leading) {
            Text("About")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 4)
                Text(fetch.user[0].bio)
//                Text("Hey y’all, I’m \(deleg.firstName). I study Int’l Law & Institutions at Indiana Univ, and am minoring in Music. I’m hoping to meet others with similar interests and make friends!")
                .font(.subheadline)
                .lineLimit(5)
                
            }.padding([.top, .horizontal], 15)
            .padding([.bottom], 35)
            //.frame(maxWidth: .infinity)
            

//            VStack(alignment:.leading){
//                Text("My Sessions")
//                    .fontWeight(.bold)
//                    .font(.headline)
//            }
             
            
            // center box
//            HStack {
//                VStack{
//                    Text("10")
//                    .font(.headline)
//                    Text("Created")
//
//                }.padding([.top, .bottom, .horizontal], 13)
//
//
//                Divider()
//                    .frame(height: 70)
//                .padding(.horizontal, 13)
//
//                VStack{
//                    Text("12")
//                    .font(.headline)
//                    Text("Joined")
//                }.padding([.top, .bottom, .horizontal], 13)
//
//
//
//            }
//               // .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(Color.gray, lineWidth: 2)
//                .frame(width: 300, height: 70)
//                .shadow(color: .black, radius: 50)
//
//                )
            
            
            
        }.navigationBarTitle("Profile")
           
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
