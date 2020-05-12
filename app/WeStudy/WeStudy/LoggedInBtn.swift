//
//  LoggedInBtn.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/25/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct LoggedInBtn: View {
    
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        NavigationLink(destination: deleg.homePage) {
            Text("Enter")
                //.font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 180.0, height: 50)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .foregroundColor(Color.white)
        }
        .cornerRadius(10)
    }
}

struct LoggedInBtn_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInBtn()
    }
}
