//
//  Task_TrackerTests.swift
//  Task TrackerTests
//
//  Created by Teesma M on 31/03/26.
//

import Testing
@testable import Task_Tracker
import Foundation

struct Task_TrackerTests {

    @Test
    func testAddTask() async throws {
        let mock = MockTaskRepository()
        let vm = TaskViewModel(repository: mock)

        vm.addTask(title: "Test Task")

        #expect(vm.tasks.count == 1)
    }

    @Test
    func testToggleTask() async throws {
        let mock = MockTaskRepository()
        let vm = TaskViewModel(repository: mock)

        vm.addTask(title: "Test")
        guard let task = vm.tasks.first else {
            Issue.record("No task found after addTask")
            return
        }
        vm.toggleTask(task)

        #expect(vm.tasks.first?.isCompleted == true)
    }

    @Test
    func testDeleteTask() async throws {
        let mock = MockTaskRepository()
        let vm = TaskViewModel(repository: mock)

        vm.addTask(title: "To Delete")
        #expect(vm.tasks.count == 1)

        vm.deleteTask(at: IndexSet(integer: 0))
        #expect(vm.tasks.count == 0)
    }

    @Test
    func testFetchTasks() async throws {
        let mock = MockTaskRepository()
        let vm = TaskViewModel(repository: mock)

        vm.addTask(title: "Task 1")
        vm.addTask(title: "Task 2")

        #expect(vm.tasks.count == 2)
    }
}
