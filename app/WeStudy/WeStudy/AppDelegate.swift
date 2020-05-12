//
//  AppDelegate.swift
//  WeStudy
//
//  Created by Khalea Berry on 1/20/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import UIKit
// Ref for Sign-In https://developers.google.com/identity/sign-in/ios/sign-in?ver=swift
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    // Reference for the app's universal map — prevents multiple maps from being created, increases speed?
    let homePage = HomeMap()
    
    // User Credentials
    var firstName : String = ""
    var lastName : String = ""
    var userID : Int = 0
    var userEmail : String = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Init Sign-in
        GIDSignIn.sharedInstance().clientID = "814026850912-tuqc9guksm5qntraadld539u14k2smgo.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    // GIDSignInDelegate Protocol
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("User has not signed in before, or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        // Perform any operations on the signed in user here
        
        
        //let userId = user.userID // Client Side use only
        //userID = user.authentication.idToken // Safe to send to server
        firstName = user.profile.givenName
        lastName = user.profile.familyName
        userEmail = user.profile.email
        
        //send to server
//        let parameters = "firstName=\(firstName)&lastName=\(lastName)&email=\(userEmail)"
//                      
//        // API url - http://cgi.sice.indiana.edu/~team50/api/AddUser.php
//        let serverURL = URL(string: "https://cgi.sice.indiana.edu/~team50/team-50/database/AddUser.php")
//               
//        // Create url request object
//        var request = URLRequest(url: serverURL!)
//        request.httpMethod = "POST"
//               
//        // Add parameters to request body
//        request.httpBody = parameters.data(using: .utf8)
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//               
//        struct AddUserResponse : Codable {
//            var message : String
//            var userID: Int
//        }
//               
//               // Create data task
//        URLSession.shared.dataTask(with: request) { data, response, error in
//                       
//                       if (error != nil) {
//                           print("Connection Error: \(String(describing: error))")
//                       }
//                       
//                       // Check response code
//                       if let responseCode = response as? HTTPURLResponse {
//                           let code = responseCode.statusCode
//                           print("Status: \(code)")
//                       }
//                       
//                       // Data
//                       // TODO add server messages for alerts
//                       if let data = data {
//                           do {
//                            var serverResponse = try JSONDecoder().decode(AddUserResponse.self, from: data)
//                               print(serverResponse)
//                               print(serverResponse.message)
//                            serverResponse.userID = self.userID
//                               
//                           } catch let error {
//                               print("Data Error: \(error)")
//                           }
//                       }
//        }.resume()
//        
        // Load sessions
        
        
        // Redirect page to Homemap
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform operations when the user disconnects
        // TODO add sign out to Account page
    }


}

