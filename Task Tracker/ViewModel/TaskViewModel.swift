//
//  TaskViewModel.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []

    private let repository: TaskRepositoryProtocol

    init(repository: TaskRepositoryProtocol = CoreDataTaskRepository()) {
        self.repository = repository
        fetchTasks()
    }

    func fetchTasks() {
        tasks = repository.fetchTasks()
    }

    func addTask(title: String) {
        repository.addTask(title: title)
        fetchTasks()
    }

    func toggleTask(_ task: TaskItem) {
        repository.toggleTask(task)
        fetchTasks()
    }

    func deleteTask(at offsets: IndexSet) {
            offsets.map { tasks[$0] }.forEach { repository.deleteTask($0) }
            fetchTasks()
        }
}
