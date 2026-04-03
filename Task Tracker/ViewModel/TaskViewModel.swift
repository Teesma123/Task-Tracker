//
//  TaskViewModel.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskEntity] = []

    private var context = CoreDataManager.shared.context

    init(context: NSManagedObjectContext = CoreDataManager.shared.context) {
        self.context = context
        fetchTasks()
    }

    func fetchTasks() {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()

        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \TaskEntity.isCompleted, ascending: true),
            NSSortDescriptor(keyPath: \TaskEntity.createdAt, ascending: false)
        ]

        do {
            tasks = try context.fetch(request)
        } catch {
            print("Fetch failed")
        }
    }

    func addTask(title: String) {
        let newTask = TaskEntity(context: context)
        newTask.id = UUID()
        newTask.title = title
        newTask.isCompleted = false
        newTask.createdAt = Date()

        CoreDataManager.shared.save()
        fetchTasks()
    }

    func toggleTask(_ task: TaskEntity) {
        task.isCompleted.toggle()
        CoreDataManager.shared.save()
        fetchTasks()
    }

    func deleteTask(at offsets: IndexSet) {
        offsets.map { tasks[$0] }.forEach(context.delete)
        CoreDataManager.shared.save()
        fetchTasks()
    }
}
