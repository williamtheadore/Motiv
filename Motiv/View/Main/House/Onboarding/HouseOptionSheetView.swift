//
//  HouseOptionSheetView.swift
//  Motiv
//
//  Created by William Little on 2022-05-28.
//

import SwiftUI

struct HouseOptionSheetView: View {
    
    @EnvironmentObject var houseVM: HouseViewModel
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                
                Text("Before you begin,")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.horizontal)
                
                NavigationLink(destination: {
                    CreateHouseScreen()
                        .environmentObject(houseVM)
                }, label: {
                    OptionCardView(proxy: proxy, titleText: "Create a house", captionText: "Create your house type and invite\nyour housemates to join", sfSymbol: "plus")
                })
                
                NavigationLink(destination: {
                    
                }, label: {
                    OptionCardView(proxy: proxy, titleText: "Join a house", captionText: "Join an existing house and start\nhosting events", sfSymbol: "house")
                })
                
                
                
                Button(action: {
                    Void()
                }, label: {
                    Text("Skip")
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                })
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG"))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct HouseOptionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HouseOptionSheetView()
    }
}

struct OptionCardView: View {
    
    var proxy: GeometryProxy
    
    var titleText: String
    var captionText: String
    var sfSymbol: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: proxy.size.width - 30, height: proxy.size.height / 4.5)
                .foregroundColor(Color("DarkBlue"))
            
            HStack {
                VStack(alignment: .leading) {
                    Image(systemName: sfSymbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.black)
                        .background(Circle().foregroundColor(.white).frame(width: 30, height: 30))
                    Text(titleText)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Text(captionText)
                        .foregroundColor(Color("ButtonTitle"))
                        .font(.footnote)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)

                    
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
            }
        }
    }
}
