//
//  CreateHouseScreen.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import SwiftUI

struct CreateHouseScreen: View {
    
    // MARK: Allows for a custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: Animation used in view
    var animation: Animation {
        Animation.easeInOut
    }
    
    
    @State var houseName: String = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 25) {
            
            // MARK: Navigation back button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                NavBackButton()
                    .frame(alignment: .leading)
                    .animation(animation)

            })
            
            // MARK: Title with Leading Alignment
            Text("Create House")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 25)
                .animation(animation)
            
            // MARK: Add Cover Photo Rectangle
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.maxX - 39, height: 170)
                    .foregroundColor(Color.white)
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.maxX - 40, height: 169)
                    .foregroundColor(Color("BG"))
                
                VStack(alignment: .center) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color("LightBlue"))
                    Text("Add cover photo")
                        .foregroundColor(Color("LightBlue"))
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
            .animation(animation)

            
            GenericTextField(text: "House Name", input: $houseName)
                .animation(animation)
            
            HouseDropDownMenu()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
        .navigationBarHidden(true)
        
    }
}

struct CreateHouseScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateHouseScreen()
    }
}
