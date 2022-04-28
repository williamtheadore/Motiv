//
//  OptionCardView.swift
//  Motiv
//
//  Created by William Little on 2022-04-27.
//

import SwiftUI

struct OptionCardView: View {
    
    let titleText: String
    let captionText: String
    let systemImageName: String
    
    var body: some View {
        ZStack {
            
            // MARK: Background Circ
            RoundedRectangle(cornerRadius: 15)
                .frame(width: UIScreen.main.bounds.maxX - 30, height: 150)
                .foregroundColor(Color("DarkBlue"))
            
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Image(systemName: self.systemImageName)
                            .resizable()
                            .foregroundColor(Color("BG"))
                            .frame(width: 20, height: 20)
                    }
                    .offset(y: -3)

                    
                    Text(self.titleText)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title3)
                    Text(self.captionText)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 22)
                    .foregroundColor(.white)
            }
             .padding(.horizontal, 35)
            
        }
    }
}

struct OptionCardView_Previews: PreviewProvider {
    static var previews: some View {
        OptionCardView(titleText: "Create a house", captionText: "Create your house type and invite\nyour housemates to join.", systemImageName: "plus")
    }
}
