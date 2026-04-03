//
//  AppCoordinator.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func goToDetail(taskID: UUID) {
        path.append(taskID)
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
