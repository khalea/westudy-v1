//
//  ListView.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 2/27/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var resultsCount = 0;
    var results = [["users","fname","lname","DOB"],["userGroups","groupid","userid","isowner",""]];
    var body: some View {
        
        for res in results {
            
        }
    
        Text("\(resultsCount) results for \(SearchBar.text)")
        print("hello")
        for res in results {
                   //need to identify which table the result came from and format it accordingly
                   
                   //use a switch or if statements
                   if res[0] == "users" {
                       
                   }
                   if else res[0] == "" {
                       
                   }
                   switch res[0] //info at positon 0
                   {
                   case == "users":
                       <#code#>
                   default:
                       <#code#>
                   }
                   
               }
    }

        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

/*
 https:// developer.apple.com/tutorials/swiftui/creating-and-combining-views
 When creating a SwiftUI view, you describe its content, layout, and behavior in the view’s body property; however, the body property only returns a single view. You can combine and embed multiple views in stacks, which group views together horizontally, vertically, or back-to-front.
 
 */
