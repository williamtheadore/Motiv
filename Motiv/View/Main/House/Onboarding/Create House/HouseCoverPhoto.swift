//
//  HouseCoverPhoto.swift
//  Motiv
//
//  Created by William Little on 2022-06-21.
//

import SwiftUI

struct HouseCoverPhoto: View {
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    @EnvironmentObject var houseVM: HouseViewModel
        
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Title
            Text("Set House Cover Photo")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
            
            // Title caption
            Text("Help people recongnize your house")
                .foregroundColor(.gray)
                .font(.footnote)
            
            // MARK: Image Selection
            GeometryReader { proxy in
                ZStack {
                    if image != nil {
                        image
                            .scaledToFill()
                            .frame(width: proxy.size.width - 40, height: 200)
                    } else {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("LightBlue"), lineWidth: 2)
                            .frame(width: proxy.size.width - 40, height: 200)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                .padding()
            }
            
            if image != nil {
                NavigationLink(destination: {
                    HouseCoverPhoto()
                        .environmentObject(houseVM)
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: UIScreen.main.bounds.maxX - 50, height: 60)
                            .foregroundColor(Color("LightBlue"))
                        Text("Continue")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                            .foregroundColor(.black)
                            .padding(.trailing, 40)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        // TODO: Upload photo to Firebase storage
                    }
                })
            } else {
                
            }
            
        }
        .sheet(isPresented: $showingImagePicker, content: {
            ImageSelectService(image: $inputImage)
        })
        .onChange(of: inputImage, perform: { _ in
            loadImage()
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
    }
}

struct HouseCoverPhoto_Previews: PreviewProvider {
    static var previews: some View {
        HouseCoverPhoto()
    }
}
