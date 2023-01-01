//
//  ContentView.swift
//  Tasks
//
//  Created by Rob Broadwell on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tasks = TasksService()
    
    var body: some View {
        VStack {
            header
            menu
            list
            footer
        }
    }
    
    var header: some View {
        ZStack {
            Text("Tasks")
                .font(.title)
            
            HStack {
                Spacer()
                Image(systemName: "brain.head.profile")
            }
            .padding()
        }
    }
    
    var menu: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(tasks.groups) { group in
                    Button {
                        tasks.selectedGroup = group
                    } label: {
                        Text(group.title)
                            .bold(tasks.selectedGroup?.id == group.id)
                    }
                }
                Button("+New list") {
                    tasks.addGroup(TaskGroup(title: "Roberto's"))
                }
            }
            .padding([.horizontal], 10)
        }
    }
    
    var list: some View {
        VStack {
            if let group = tasks.selectedGroup {
                List(group.contents) { task in
                    HStack {
                        Image(systemName: "circle")
                        Text(task.title)
                            .padding([.horizontal])
                        Spacer()
                        Image(systemName: "star")
                    }
                }
                .listStyle(.plain)
            } else {
                Color.clear
            }
        }
    }
    
    var footer: some View {
        ZStack {
            HStack {
                Image(systemName: "square.stack.3d.up")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 20, height: 4)
                    .padding()
            }
            .background(Color.black.opacity(0.05))
            
            HStack {
                Button {
                    tasks.addTask(Task(title: UUID().uuidString))
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
