//
//  TaskDetailView.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import SwiftUI

struct TaskDetailView: View {
    let task: TaskItem
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text(task.title)
                .font(.title3)
                .fontWeight(.bold)

            Text(task.isCompleted ? "Completed" : "Pending")
                .foregroundColor(task.isCompleted ? .green : .orange)

            Spacer()
        }
        .padding()
    }
}

