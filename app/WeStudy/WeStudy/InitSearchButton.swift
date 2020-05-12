//
//  SearchButtonToList.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 4/11/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

struct InitSearchButton: View {

    // format borrowed from SessionBtn.swift by Khalea Berry
    @State var navToList = false
    
    var body: some View {
        
        // button designa and action
        Button(action: {self.navToList.toggle(); print("Search button tapped")}) {
                        
                // magnifying glass from SF Symbols by Apple
                Image(systemName: "magnifyingglass")
                
                // uniform formatting with SessionBtn
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))
                .clipShape(Circle())
                .shadow(radius: 5)
                // open list view with search bar at top as sheet
                .sheet(isPresented: $navToList) {
                    SearchListView()        }
        }
    }
}

struct InitSearchButton_Previews: PreviewProvider {
    static var previews: some View {
        InitSearchButton()
    }
}

