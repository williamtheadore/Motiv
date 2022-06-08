//
//  ActivitySortButton.swift
//  Motiv
//
//  Created by Thavish Perera on 2022-06-07.
//
import SwiftUI

struct ActivitySortButton: View {
    
    let text: String
    let isSelected: ActivityScreen.EventsTab
    let equals: ActivityScreen.EventsTab

    let gradientColors = [Color(red: 0, green: 195/255, blue: 1), Color(red: 49/255, green: 246/255, blue: 197/255)]

    
    var body: some View {
        ZStack {
            if isSelected != equals {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 1)
                    .frame(width: 120, height: 33)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 120, height: 33)
            }

            Text(text)
                .font(.system(size: 14))
                .foregroundColor(isSelected == equals ? Color("BG") : .white)
        }
    }
}

struct ActivitySortButton_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySortButton(text: "Today", isSelected: .week, equals: .week)
    }
}
