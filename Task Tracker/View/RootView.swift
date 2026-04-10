//
//  RootView.swift
//  Task Tracker
//
//  Created by Teesma M on 02/04/26.
//

import SwiftUI

struct RootView: View {
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.destination(for: .taskList)
                .navigationDestination(for: AppRoute.self) { route in
                    coordinator.destination(for: route)
                }
        }
    }
}
