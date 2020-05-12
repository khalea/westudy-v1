//
//  AccountButton.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct AccountButton: View {
    var body: some View {
        NavigationLink(destination: AccountView()) {
            
            HStack {
                Text("🧝🏾‍♀️")
                    .font(.system(size: 16))
                    .padding(.leading, 20)
                    .padding(.trailing, 0)
                Text("Account")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 100.0, height: 50)
                    .foregroundColor(Color.black)
                    .padding(.leading, -20)
            }
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: Color(Color.RGBColorSpace.sRGB, red: 0.0, green: 0.0, blue: 0.0, opacity: 0.30), radius: 3, x: 4, y: 6)
        }.isDetailLink(true)
        
    }
}

struct AccountButton_Previews: PreviewProvider {
    static var previews: some View {
        AccountButton()
    }
}
