//
//  SearchSessionViewer.swift
//  WeStudy
//
//  Created by Nzube Afoaku on 3/31/20.
//  Copyright © 2020 Fifty. All rights reserved.
//

import SwiftUI

struct SearchSessionViewer: View {

    var body: some View {
            
        VStack(alignment: .leading) {
            Text("Title")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text("Information")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.top)
            HStack {
                Text("<date>")
                    .multilineTextAlignment(.leading)
                Text("<time>")
                Text("<building>")
                Text("<room>")

                
            }

            Text("Description")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.top)
            Text("<description text>")
                .multilineTextAlignment(.leading)
                .padding(.bottom)
                .frame(width: 100.0, height: 40.0)
                .background(Color(red: 169.0/255, green: 5.0/255, blue: 51.0/255))

        }
    }
}


struct SearchSessionViewer_Previews: PreviewProvider {
    static var previews: some View {
        SearchSessionViewer(
        )
    }
}
