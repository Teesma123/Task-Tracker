//
//  MockTaskRepository.swift
//  Task TrackerTests
//
//  Created by Teesma M on 10/04/26.
//

import Foundation
@testable import Task_Tracker

class MockTaskRepository: TaskRepositoryProtocol {
    var mockTasks: [TaskItem] = []

    func fetchTasks() -> [TaskItem] { mockTasks }

    func addTask(title: String) {
        let task = TaskItem(
            id: UUID(),
            title: title,
            isCompleted: false,
            createdAt: Date()
        )
        mockTasks.append(task)
    }

    func toggleTask(_ task: TaskItem) {
        if let index = mockTasks.firstIndex(where: { $0.id == task.id }) {
            mockTasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(_ task: TaskItem) {
        mockTasks.removeAll { $0.id == task.id }
    }
}
