//
//  ActivityScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct ActivityScreen: View {
    
    @EnvironmentObject var rootVM: RootViewModel
    
    @State var selectedTab: EventsTab = .week
    
    enum EventsTab {
        
        case today
        case week
        case month
        
    }
    
    var body: some View {
        VStack {
            
            // MARK: Search, Events Text, Notifications Bell
            HStack(spacing: 125) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.white)
                    .frame(alignment: .leading)
                Text("Events")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Image(systemName: "bell")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.white)
                    .frame(alignment: .trailing)

            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.top, 15)
            
            HStack(spacing: 35) {
                
                // MARK: Today button
                Button(action: {
                    self.selectedTab = .today
                }, label: {
                    Text("Today")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1)
                                .frame(width: 110, height: 33)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                })

                // MARK: This week button
                Button(action: {
                    self.selectedTab = .week
                }, label: {
                    Text("This week")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1)
                                .frame(width: 110, height: 33)
                        )
                })
                
                // MARK: This month button
                Button(action: {
                    self.selectedTab = .month
                }, label: {
                    Text("This month")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1)
                                .frame(width: 110, height: 33)
                        )
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            .padding(.vertical)
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct ActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityScreen()
    }
}
