//
//  MainViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import Foundation

final class MainViewModel {
    
    enum Cell {
        case item(MenuCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    let title = "Main View"
    var coordinator: MainCoordinator?
    var onUpdate = {}
    private let coreDataManager: CoreDataManager
    private var posts: [PostItem]?
    
    
    init (coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        
        reload()
        getData()
    }
    
    func getData() {
        
        let postService = PostService()
        
        postService.getPosts() { result in
            
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let items):
                
                items.forEach { post in
                    let title = post.title
                    let body = post.body
                    //let id = post.id
                    self.coreDataManager.savePost(body: body, title: title)
                    
                }
            }
        }
        
        let albumService = AlbumService()
        albumService.getAlbums() { result in
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let items):
                
                items.forEach { album in
                    
                    self.coreDataManager.saveAlbum(title: album.title)
                    
                }
            }
        }
    }
    
    func reload() {
        //let menuItems = ["Posts", "Albums", "TODOS"]
        let items = MainMenuItems.allValues
        
        cells = items.map {
            var menuCellViewModel = MenuCellViewModel($0)
            
            if let coordinator = coordinator {
                menuCellViewModel.onSelect = coordinator.onSelect
            }
            
            return .item(menuCellViewModel)
        }
        
        onUpdate()
    }
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        
        switch cells[indexPath.row] {
        case .item(let menuCellViewModel) :
            menuCellViewModel.didSelect()
        }
    }
}

