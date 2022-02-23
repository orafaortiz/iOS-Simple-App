//
//  PostViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 18/02/22.
//

import Foundation

final class PostsViewModel {
    
    enum Cell {
        case post(PostCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    let title = "Posts"
    var coordinator: PostsCoordinator?
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
        let posts = coreDataManager.fetchPosts()
        
        cells = posts.map {
            var postCellViewModel = PostCellViewModel($0)
            
            if let coordinator = coordinator {
                postCellViewModel.onSelect = coordinator.onSelect
            }
            
            return .post(postCellViewModel)
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
        case .post(let postCellViewModel) :
            postCellViewModel.didSelect()
        }
    }
}
