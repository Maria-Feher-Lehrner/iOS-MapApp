//
//  RootView.swift
//  Toiletfinder
//
//  Created by user on 03.06.24.
//

import SwiftUI

struct RootView: View {
        @StateObject var repository = Repository()
        @StateObject var favouritesManager = FavouritesManager()
        //@State private var selectedTab: Tab = .contentView
    
    enum Tab {
        case contentView
        case favouritesView
    }

        var body: some View {
            TabView(/*selection: $selectedTab*/) {
                ContentView(repository: repository)
                    //.tag(Tab.contentView)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .environmentObject(favouritesManager)
                
                FavouritesView()
                    //.tag(Tab.favouritesView)
                    .tabItem {
                        Label("Favoriten", systemImage: "star.square.on.square")
                    }
                    .environmentObject(favouritesManager)
            }
            /*.onChange(of: selectedTab) { newValue in
                if newValue != .contentView {
                    selectedTab = .contentView
                }
            }*/
        }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
