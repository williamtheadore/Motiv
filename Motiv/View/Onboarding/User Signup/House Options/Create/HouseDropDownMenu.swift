//
//  HouseDropDownMenu.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import SwiftUI

struct HouseDropDownMenu: View {
    
    @State var expand = false
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var animation: Animation {
        Animation.easeInOut
    }
    
    func selectStyle(style: String) {
        
        self.onboardingVM.houseStyle = style
        self.expand.toggle()
        
    }
    
    var body: some View {
        ZStack {

            HStack {
                VStack(alignment: .leading) {
                    
                    Text("House Type")
                        .foregroundColor(Color("OnboardingCaption"))
                        .font(.footnote)
                        .padding(.vertical, expand ? 0 : -5)
                        .offset(y: expand ? 5 : 58)

                    
                    
                    
                    if !expand {
                        Text(onboardingVM.houseStyle)
                            .foregroundColor(Color("LightBlue"))
                            .opacity(expand ? 0 : 1)
                            .offset(y: 58)
                    }
                    
                    ForEach(onboardingVM.houseStyles, id: \.self) { style in
                        VStack {
                            Button(action: {
                                selectStyle(style: style)
                            }, label: {
                                Text(style)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("LightBlue"))
                                    .padding(.vertical, 5)
                                    .offset(y: expand ? 0 : 1000)
                                    .animation(animation)
                                
                            })
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                                
                Button(action: {
                    self.expand.toggle()
                }, label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 18, height: 10)
                        .padding(.horizontal, 20)
                        .rotationEffect(Angle.degrees(expand ? 180 : 0))
                        .animation(animation)
                })
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.maxX - 60, maxHeight: expand ? 160 : 60)
        .background(Color("DarkBlue").cornerRadius(5))
        .animation(animation)
        .environmentObject(onboardingVM)
    }
}

struct HouseDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        HouseDropDownMenu().environmentObject(OnboardingViewModel())
    }
}
