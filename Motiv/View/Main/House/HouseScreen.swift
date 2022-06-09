//
//  HouseScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//

import SwiftUI

struct HouseScreen: View {
    @EnvironmentObject var rootVM: RootViewModel

    @State private var selectedTab: housePageTabs = .housemates
    let housemates = IndexingViewModel().dummyUsers.shuffled()[0 ..< 8] // TODO: Get housemates from db

    enum housePageTabs {
        case feed
        case history
        case housemates
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topTrailing) {
                Color("BG")
                    .ignoresSafeArea()
                
                Image("queenscampus") // TODO: Get house image link from db
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea()

                Image(systemName: "bell") // TODO: Convert to button or NavLink and connect to notification view
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.white)
                    .frame(alignment: .trailing)
                    .padding(.horizontal)

                VStack {
                    // TODO: Populate from db
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("HOUSE")
                                .font(.title2.weight(.light))
                            Text("79 Nelly")
                                .font(.largeTitle.weight(.medium))

                            Text("1,833")
                                .font(.title3.weight(.heavy))
                                .foregroundColor(Color("LightBlue"))
                                + Text(" Motiv Score")
                                .font(.title3.weight(.light))
                        }

                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                    // TODO: Populate from db
                    HStack {
                        VStack {
                            Text("11")
                                .font(.title.bold())
                                .foregroundColor(Color("LightBlue"))
                            Text("Events")
                                .font(.body)
                        }
                        .frame(width: geo.size.width * 0.4)
                        .padding(.vertical, 10)
                        .background(Color("DarkBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 5)

                        Spacer()

                        VStack {
                            Text("6")
                                .font(.title.bold())
                                .foregroundColor(Color("LightBlue"))
                            Text("Housemates")
                                .font(.body)
                        }
                        .frame(width: geo.size.width * 0.4)
                        .padding(.vertical, 10)
                        .background(Color("DarkBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 5)
                    }

                    // TODO: Connect link to edit view
                    NavigationLink { EmptyView() } label: {
                        Spacer()
                        Text("Edit House")
                            .font(.body.bold())
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white))
                    .padding()

                    HStack {
                        Spacer()
                        Button { selectedTab = .feed } label: {
                            VStack {
                                Image(systemName: "squareshape.split.3x3")
                                Spacer()
                                Rectangle()
                                    .frame(height: 2, alignment: .bottom)
                                    .foregroundColor(.blue)
                                    .opacity(selectedTab == .feed ? 1 : 0)
                            }
                        }
                        Spacer()
                        Button { selectedTab = .history } label: {
                            VStack {
                                Image(systemName: "clock.arrow.circlepath")
                                Spacer()
                                Rectangle()
                                    .frame(height: 2, alignment: .bottom)
                                    .foregroundColor(.blue)
                                    .opacity(selectedTab == .history ? 1 : 0)
                            }
                        }
                        Spacer()
                        Button { selectedTab = .housemates } label: {
                            VStack {
                                Image(systemName: "person.3.fill")
                                Spacer()
                                Rectangle()
                                    .frame(height: 2, alignment: .bottom)
                                    .foregroundColor(.blue)
                                    .opacity(selectedTab == .housemates ? 1 : 0)
                            }
                        }
                        Spacer()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 25))
                    .padding(.top, 20)

                    // TODO: Complete feed and history tabs
                    switch selectedTab {
                    case .feed:
                        Text("Show Feed Here")
                    case .history:
                        Text("Show History Here")
                    case .housemates:
                        GeometryReader { innerGeo in
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack {
                                    ForEach(housemates) {
                                        HousemateListItem(user: $0)
                                            .padding(.vertical, 10)
                                    }
                                }
                            }
                            .frame(height: innerGeo.size.height)
                            .padding(.vertical, 5)
                        }
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .padding([.top, .horizontal])
                .background(Color("BG"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                // TODO: Possibly get rid of this depending on how the addition of the tab bar makes it look
                .ignoresSafeArea(SwiftUI.SafeAreaRegions.all, edges: .bottom)
                .padding(.top, geo.size.height * 0.2)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct HouseScreen_Previews: PreviewProvider {
    static var previews: some View {
        HouseScreen()
    }
}
