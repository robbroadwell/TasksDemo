//
//  Models.swift
//  Tasks
//
//  Created by Rob Broadwell on 1/1/23.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var contents: [Task] = []
    
    mutating func addTask(_ task: Task) {
        contents.append(task)
    }
}

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
}
