//
//  TaskListView.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    @State private var newTask = ""

    var body: some View {
        VStack(spacing: 16) {

            HStack {
                TextField("Add a new task...", text: $newTask)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                Button {
                    guard !newTask.isEmpty else { return }
                    viewModel.addTask(title: newTask)
                    newTask = ""
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.tasks, id: \.id) { task in
                        TaskRowView(task: task) {
                            viewModel.toggleTask(task)
                        }
                        .onTapGesture {
                            coordinator.goToDetail(task: task)
                        }
                    }
                }
                .padding()
            }

            Spacer()
        }
        .navigationTitle("Tasks")
    }
}

#Preview {
    let coordinator = AppCoordinator()
    
    TaskListView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.taskViewModel)
}
