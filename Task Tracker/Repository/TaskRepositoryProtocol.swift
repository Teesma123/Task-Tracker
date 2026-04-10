//
//  TaskRepositoryProtocol.swift
//  Task Tracker
//
//  Created by Teesma M on 10/04/26.
//

protocol TaskRepositoryProtocol {
    func fetchTasks() -> [TaskItem]
    func addTask(title: String)
    func toggleTask(_ task: TaskItem)
    func deleteTask(_ task: TaskItem)
}
