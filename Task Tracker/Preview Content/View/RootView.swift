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
            
            // Initial Screen
            TaskListView()
                .environmentObject(coordinator)
            
                // Navigation Destination
                .navigationDestination(for: UUID.self) { taskID in
                    TaskDetailView(taskID: taskID)
                }
        }
    }
}
