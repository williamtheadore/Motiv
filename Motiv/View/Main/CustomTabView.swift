//
//  CustomTabView.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct CustomTabView: View {
    
    var currentTab: Tab
    
    
    
    var body: some View {
        HStack {
            Button(action: {
                self.currentTab = .map
            }, label: {
                Image(systemName: "map.fill")
                    .resizable()
                    .frame(width: 20)
                    .foregroundColor(Color("LightBlue"))
            })
            Button(action: {
                currentTab = .map
            }, label: {
                Image(systemName: "map.fill")
                    .resizable()
                    .frame(width: 20)
                    .foregroundColor(Color("LightBlue"))
            })
        }
                    .frame(maxWidth: .infinity)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
