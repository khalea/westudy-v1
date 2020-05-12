//
//  JoinButton.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 4/6/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct JoinButton: View {
    var body: some View {
         Button(action: {
                      print("Join")})
                         {
                           Text("Create")
                               .fontWeight(.bold)
                               .font(.system(size: 22))
                          }
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                        .cornerRadius(10)    }
}



struct JoinButton_Previews: PreviewProvider {
    static var previews: some View {
        JoinButton()
    }
}
