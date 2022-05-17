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
    
    // MARK: Changes view to image picker selection
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?

    
    // MARK: Animation used in view
    var animation: Animation {
        Animation.easeInOut
    }
    
    // MARK: Loads input image
    private func loadImage() {
        guard let inputImage = inputImage else { return }
        self.image = Image(uiImage: inputImage)
    }
    
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
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
                .padding(.bottom, 5)
                .animation(animation)
            
            // MARK: Add Cover Photo Rectangle
            // If image is selected
            if self.image != nil {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 351, height: 170)
                        .foregroundColor(Color.white)
                    image!
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 169)
                        .cornerRadius(15)
                    
                }
                .padding(.vertical, 10)
                .animation(animation)
                
            // MARK: If image is not selected yet display SF plus
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 351, height: 170)
                        .foregroundColor(Color.white)
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 169)
                        .foregroundColor(Color("BG"))
                    Button(action: {
                        self.showingImagePicker = true
                    }, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color("LightBlue"))
                    })
                    
                }
                .padding(.vertical, 10)
                .animation(animation)
            }
            
            Text("Add cover photo")
                .foregroundColor(Color("LightBlue"))
                .font(.footnote)
                .fontWeight(.light)
            

            
            GenericTextField(text: "House Name", input: $onboardingVM.houseName)
                .animation(animation)
            
            HouseDropDownMenu()
                .padding(.vertical, 10)
            
            Text("Housemates")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            NavigationLink(destination: {
                HousemateSearch()
            }, label: {
                CustomNavLink(housemates: $onboardingVM.housemates)
            })

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
        .navigationBarHidden(true)
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImageSelectService(image: $inputImage)
        }
        .environmentObject(onboardingVM)
        
    }
}

struct CreateHouseScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateHouseScreen()
    }
}
