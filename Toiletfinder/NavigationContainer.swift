//
//  NavigationContainer.swift
//  Toiletfinder
//
//  Created by user937599 on 6/11/24.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {
    let content: Content
    @State private var navigationID = UUID()

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationView {
            content
        }
        .id(navigationID)
        .onChange(of: navigationID) { _ in
            // Optionally perform actions on navigation stack reset
        }
    }

    func resetNavigation() {
        navigationID = UUID()
    }
}
