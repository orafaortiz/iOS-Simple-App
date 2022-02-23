//
//  TodoCellViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import UIKit
import CoreData

struct TodoCellViewModel {
    
    var todoTitle: String? {
        todo.title
    }
    
    var todoCompleted: Bool? {
        todo.completed
    }
    
    var onSelect: (NSManagedObjectID) -> Void = { _ in }
    
    private let todo: TodoItem
    
    init (_ todo: TodoItem) {
        self.todo = todo
    }
    
    func didSelect() {
        
        onSelect(todo.objectID)
    }
}

