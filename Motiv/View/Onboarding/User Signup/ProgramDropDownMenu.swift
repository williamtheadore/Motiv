//
//  ProgramDropDownMenu.swift
//  Motiv
//
//  Created by William Little on 2022-04-26.
//

import SwiftUI

struct ProgramDropDownMenu: View {
    
    @State var expand = false
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    
    var animation: Animation {
        Animation.easeInOut
    }
    
    func selectProgram(program: String) {
        
        self.onboardingVM.program = program
        self.expand.toggle()
        
    }
    
    var body: some View {
        ZStack {
            
            // MARK: Background Rectangle
            //            RoundedRectangle(cornerRadius: 10)
            //                .frame(width: UIScreen.main.bounds.maxX - 60, height: expand ? 775 : 65)
            //                .foregroundColor(Color("DarkBlue"))
            //                .offset(y: -3)
            //                .animation(animation)
            
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Program")
                        .foregroundColor(Color("OnboardingCaption"))
                        .font(.footnote)
                        .padding(.vertical, expand ? 0 : -5)
                        .offset(y: expand ? 5 : 363)

                    
                    
                    
                    if !expand {
                        Text(onboardingVM.program)
                            .foregroundColor(Color("LightBlue"))
                            .opacity(expand ? 0 : 1)
                            .offset(y: 363)
                    }
                    
                    ForEach(onboardingVM.programs, id: \.self) { program in
                        VStack {
                            Button(action: {
                                selectProgram(program: program)
                            }, label: {
                                Text(program)
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
        .frame(maxWidth: UIScreen.main.bounds.maxX - 60, maxHeight: expand ? UIScreen.main.bounds.maxY : 60)
        .background(Color("DarkBlue").cornerRadius(5))
        .animation(animation)
    }
}

struct ProgramDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        ProgramDropDownMenu().environmentObject(OnboardingViewModel())
    }
}
