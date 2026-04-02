//
//  Task_TrackerTests.swift
//  Task TrackerTests
//
//  Created by Teesma M on 31/03/26.
//

import Testing
@testable import Task_Tracker

struct Task_TrackerTests {

    @Test
    func testAddTask() async throws {
        let coreData = CoreDataManager(inMemory: true)
        let vm = TaskViewModel(context: coreData.context)

        vm.addTask(title: "Test Task")

        #expect(vm.tasks.count == 1)
    }

    @Test
    func testToggleTask() async throws {
        let vm = TaskViewModel()
        vm.addTask(title: "Test")

        let task = vm.tasks.first!
        vm.toggleTask(task)

        #expect(vm.tasks.first?.isCompleted == true)
    }
}
