//
//  NoCreatedSessionsView.swift
//  WeStudy
//
//  Created by Kiarra Pratchett on 2/26/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI


struct NoCreatedSessionsView: View {
    var body: some View {
        NavigationView{
           
        VStack{
            
            Spacer()
            Image("NoSessionsCreated")
            
            Text("No Sessions Created!")
                .fontWeight(.bold)
                .font(.title)
            Spacer()
            Spacer()
            
        }
      .navigationBarTitle(Text("Created Sessions"))
     }
  }
}
struct NoCreatedSessionsView_Previews: PreviewProvider {
    static var previews: some View {
        NoCreatedSessionsView()
    }
}
