//
//  ToHome.swift
//  WeStudy
//
//  Created by Khalea Berry on 2/7/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct ToHome: View {
    
    let deleg = UIApplication.shared.delegate as! AppDelegate
    
    var body: some View {
        
        NavigationLink(destination: deleg.homePage) {
            Text("Continue")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .frame(width: 300.0, height: 50)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .foregroundColor(Color.white)
        }
        .cornerRadius(10)

    }
}

struct ToHome_Previews: PreviewProvider {
    static var previews: some View {
        ToHome()
    }
}
