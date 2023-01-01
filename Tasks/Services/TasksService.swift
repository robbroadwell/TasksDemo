//
//  TasksService.swift
//  Tasks
//
//  Created by Rob Broadwell on 1/1/23.
//

import Combine

class TasksService: ObservableObject {
    @Published var groups: [TaskGroup] = []
    @Published var selectedGroup: TaskGroup?
    
    func addTask(_ task: Task) {
        selectedGroup?.addTask(task)
        
        if let index = groups.firstIndex(where: { $0.id == selectedGroup?.id }) {
            groups[index].contents.append(task)
        }
    }
    
    func addGroup(_ group: TaskGroup) {
        groups.append(group)
        selectedGroup = group
    }
}
