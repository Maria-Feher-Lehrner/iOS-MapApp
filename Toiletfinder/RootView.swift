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

        var body: some View {
            TabView() {
                ContentView(repository: repository)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .environmentObject(favouritesManager)
                    
                FavouritesView()
                    .tabItem {
                        Label("Favoriten", systemImage: "star.square.on.square")
                    }
                    .environmentObject(favouritesManager)
            }
        }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
