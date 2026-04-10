//
//  TaskViewModel.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import Foundation
import CoreData

class CoreDataTaskRepository: TaskRepositoryProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataManager.shared.context) {
        self.context = context
    }

    func fetchTasks() -> [TaskItem] {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \TaskEntity.isCompleted, ascending: true),
            NSSortDescriptor(keyPath: \TaskEntity.createdAt, ascending: false)
        ]
        let entities = (try? context.fetch(request)) ?? []

        // CoreData → App World
        return entities.map { entity in
            TaskItem(
                id: entity.id ?? UUID(),
                title: entity.title ?? "",
                isCompleted: entity.isCompleted,
                createdAt: entity.createdAt ?? Date()
            )
        }
    }

    func addTask(title: String) {
        let entity = TaskEntity(context: context)
        entity.id = UUID()
        entity.title = title
        entity.isCompleted = false
        entity.createdAt = Date()
        CoreDataManager.shared.save()
    }

    func toggleTask(_ task: TaskItem) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
        if let entity = try? context.fetch(request).first {
            entity.isCompleted.toggle()
            CoreDataManager.shared.save()
        }
    }

    func deleteTask(_ task: TaskItem) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
        if let entity = try? context.fetch(request).first {
            context.delete(entity)
            CoreDataManager.shared.save()
        }
    }
}
