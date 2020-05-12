//
//  EditProfileButton.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/19/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct EditProfileButton: View {
    var user: User
    var body: some View {
        NavigationLink(destination: EditProfileView(user: user)) {
            
            HStack {

                Text("Edit Profile")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    //.padding(.leading, -20)
                    .padding(15)
                 .cornerRadius(15)
                Image(systemName: "pencil")
                    .font(.system(size: 16))
                    .padding(.leading, 0)
                    .padding(10)
                 .cornerRadius(15)
            }
            .foregroundColor(Color.white)
            .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
            .frame(width: 200.0, height: 50)
         .cornerRadius(15)
           
           
            
        }.isDetailLink(true)
    }
}

struct EditProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileButton(user: User.init(id: 1, firstName: "first", lastName: "last", userName: "user", bio: "bio", phone: "phone"))
    }
}
