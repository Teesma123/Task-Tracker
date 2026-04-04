//
//  TaskRowView.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import SwiftUI

struct TaskRowView: View {
    let task: TaskEntity
    var onToggle: (() -> Void)?

    var body: some View {
        HStack {
            Button(action: {
                onToggle?()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .gray : .blue)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title ?? "")
                    .font(.headline)
                    .foregroundColor(task.isCompleted ? .gray : .primary)

                Text(task.createdAt ?? Date(), style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5)
        .opacity(task.isCompleted ? 0.6 : 1)
    }
}
