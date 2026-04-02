//
//  Task_TrackerApp.swift
//  Task Tracker
//
//  Created by Teesma M on 31/03/26.
//

import SwiftUI

@main
struct Task_TrackerApp: App {
    let persistence = CoreDataManager.shared
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
