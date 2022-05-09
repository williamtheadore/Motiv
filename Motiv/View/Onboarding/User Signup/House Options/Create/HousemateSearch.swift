//
//  HousemateSearch.swift
//  Motiv
//
//  Created by William Little on 2022-05-03.
//

import SwiftUI

struct HousemateSearch: View {
    
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    @StateObject var indexVM = IndexingViewModel()
    
    @State var users = [User]()
        
    // MARK: Allows for a custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: Animation used in views
    var animation: Animation {
        Animation.easeInOut
    }
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                
                // MARK: Navigation back button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    NavBackButton()
                        .frame(alignment: .leading)
                        .animation(animation)
                })
                    .padding(.bottom, 5)
                
                Text("Find Housemates")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // MARK: Search Bar
                GenericSearchBar(text: "Name or Username", input: $onboardingVM.housemateSearch)
                
                // MARK: Users List
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(indexVM.users, id: \.self) { user in
                        AddUserView(user: user)
                            .padding(.vertical, 10)
                    }
                    
                }
                
                // MARK:
                Button(action: {
                    
                }, label: {
                    
                })
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            
            
        }
        .onChange(of: onboardingVM.housemateSearch) { newSearch in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                indexVM.searchUsers(onboardingVM.housemateSearch)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG"))
        .navigationBarHidden(true)
        .environmentObject(onboardingVM)
//        .onAppear(perform: {
//            indexVM.uploadDummyUsers()
//        })
        
    }
}

struct HousemateSearch_Previews: PreviewProvider {
    static var previews: some View {
        HousemateSearch().environmentObject(OnboardingViewModel())
    }
}
