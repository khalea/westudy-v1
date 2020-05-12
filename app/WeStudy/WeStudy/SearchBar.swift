//
//  SearchBar.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 4/11/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI
import UIKit

struct SearchBar: View {
    
    // define user input variable
    @State var userQuery = ""
    // define default search bar text
    // will change to
    let searchDefault = "(ex. Amelia James, INFO 495, Poetry Nerds)"
//    let search = UIBarButtonItem.SystemItem.search
    
    var body: some View {
        VStack {
            
            HStack {
    
           // will change to icon within search bar
                TextField(
                    searchDefault,
                    text: $userQuery,
                    onEditingChanged: { _ in print("user is typing in search bar") },
                    onCommit: {
                        print("\(self.userQuery)")
//                        ; PostQuery.init(userQuery: <#T##String#>)
                        
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.gray)
                    .padding(.leading, 2)
                    .shadow(radius: 5)
                    .keyboardType(/*@START_MENU_TOKEN@*/.asciiCapable/*@END_MENU_TOKEN@*/)
                Button(action: {
                    print("\(self.userQuery)")
//                    PostQuery.init(userQuery: String
                }) {
                    Text("🔎")
                        .font(.system(size: 20))
                        .padding(.trailing, 2)
                        .padding(.leading, 1)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}

//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//public struct TextField<Label> : View where Label : View {
//
//    /// Declares the content and behavior of this view.
//    public var body: some View { get }
//
//    /// The type of view representing the body of this view.
//    ///
//    /// When you create a custom view, Swift infers this type from your
//    /// implementation of the required `body` property.
//    public typealias Body = some View
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension TextField where Label == Text {
//
//    /// Creates an instance with a `Text` label generated from a localized title
//    /// string.
//    ///
//    /// - Parameters:
//    ///     - titleKey: The key for the localized title of `self`, describing
//    ///       its purpose.
//    ///     - text: The text to be displayed and edited.
//    ///     - onEditingChanged: An `Action` that will be called when the user
//    ///     begins editing `text` and after the user finishes editing `text`,
//    ///     passing a `Bool` indicating whether `self` is currently being edited
//    ///     or not.
//    ///     - onCommit: The action to perform when the user performs an action
//    ///     (usually the return key) while the `TextField` has focus.
