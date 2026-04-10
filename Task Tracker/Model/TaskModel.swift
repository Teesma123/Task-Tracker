//
//  File.swift
//  Task Tracker
//
//  Created by Teesma M on 01/04/26.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
}

struct TaskItem: Identifiable, Hashable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var createdAt: Date
}
