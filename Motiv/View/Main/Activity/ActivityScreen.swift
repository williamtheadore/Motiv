//
//  ActivityScreen.swift
//  Motiv
//
//  Created by William Little on 2022-05-16.
//
import SwiftUI

struct ActivityScreen: View {
    @EnvironmentObject var rootVM: RootViewModel

    @State var selectedTab: EventsTab = .week

    enum EventsTab {
        case today
        case week
        case month
    }

    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()

            VStack {
                // MARK: Search, Events Text, Notifications Bell
                HStack {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .foregroundColor(.white)
                            .frame(alignment: .leading)
                    }
                    Spacer()

                    Text("Events")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)

                    Spacer()

                    NavigationLink {
                        EmptyView()
                    } label: {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .foregroundColor(.white)
                                .frame(alignment: .trailing)

                            // TODO: Toggle the appearance of this depending on if there are notifications
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.blue)
                                .offset(x: 3, y: -3)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.top, 15)

                HStack {
                    // MARK: Today button
                    Spacer()
                    Button(action: {
                        self.selectedTab = .today
                    }, label: {
                        ActivitySortButton(text: "Today", isSelected: selectedTab, equals: .today)
                    })

                    Spacer()

                    // MARK: This week button
                    Button(action: {
                        self.selectedTab = .week
                    }, label: {
                        ActivitySortButton(text: "This week", isSelected: selectedTab, equals: .week)
                    })

                    Spacer()

                    // MARK: This month button
                    Button(action: {
                        self.selectedTab = .month
                    }, label: {
                        ActivitySortButton(text: "This month", isSelected: selectedTab, equals: .month)

                    })
                    Spacer()
                }
                .frame(alignment: .top)
                .padding(.vertical, 10)

                GeometryReader { geo in
                    ScrollView {
                        LazyVStack {
                            ForEach(0 ..< 2, id: \.self) { _ in // TODO: Populate this stack from db
                                BarEventPreview(geo: geo)
                                HouseEventPreview(geo: geo)
                            }
                        }
                    }
                }

            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct ActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityScreen()
    }
}
