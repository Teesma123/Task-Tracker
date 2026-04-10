//
//  AppCoordinator.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    private let repository: TaskRepositoryProtocol
    let taskViewModel: TaskViewModel

    init(repository: TaskRepositoryProtocol = CoreDataTaskRepository()) {
        self.repository = repository
        self.taskViewModel = TaskViewModel(repository: repository)
    }

    func goToDetail(task: TaskItem) {
        path.append(AppRoute.taskDetail(task))
    }

    func goBack() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func destination(for route: AppRoute) -> some View {
        switch route {
        case .taskList:
            TaskListView()
                .environmentObject(self)
                .environmentObject(taskViewModel)

        case .taskDetail(let task):
            TaskDetailView(task: task)
                .environmentObject(self)
                .environmentObject(taskViewModel)

        }
    }
}
