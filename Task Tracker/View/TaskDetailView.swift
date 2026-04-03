//
//  TaskDetailView.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import SwiftUI

struct TaskDetailView: View {
    let taskID: UUID
    @StateObject private var viewModel = TaskViewModel()

    var body: some View {
        if let task = viewModel.tasks.first(where: { $0.id == taskID }) {
            VStack(spacing: 20) {

                Text(task.title ?? "")
                    .font(.title3)
                    .fontWeight(.bold)

                Text(task.isCompleted ? "Completed" : "Pending")
                    .foregroundColor(task.isCompleted ? .green : .orange)

                Spacer()
            }
            .padding()
        } else {
            Text("Task not found")
        }
    }
}
