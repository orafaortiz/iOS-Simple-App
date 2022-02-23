//
//  TodosViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import Foundation

final class TodosViewModel {
    
    enum Cell {
        case todo(TodoCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    let title = "TO-DOs"
    var coordinator: TodosCoordinator?
    var onUpdate = {}
    private let coreDataManager: CoreDataManager
    
    
    init (coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        
        reload()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    
    func reload() {
        let todos = coreDataManager.fetchTodos()
        
        cells = todos.map {
            var todoCellViewModel = TodoCellViewModel($0)
            
            if let coordinator = coordinator {
                todoCellViewModel.onSelect = coordinator.onSelect
            }
            
            return .todo(todoCellViewModel)
        }
        
        onUpdate()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        
        switch cells[indexPath.row] {
        case .todo(let todoCellViewModel) :
            todoCellViewModel.didSelect()
        }
    }
}

