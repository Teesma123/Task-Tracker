//
//  AppRoute.swift
//  Task Tracker
//
//  Created by Teesma M on 10/04/26.
//

import Foundation

enum AppRoute: Hashable {
    case taskList
    case taskDetail(TaskItem)
}
