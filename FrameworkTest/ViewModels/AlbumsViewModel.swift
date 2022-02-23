//
//  AlbumsViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import Foundation

final class AlbumsViewModel {
    
    enum Cell {
        case album(AlbumCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    let title = "Albums"
    var coordinator: AlbumsCoordinator?
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
        let albums = coreDataManager.fetchAlbums()
        
        cells = albums.map {
            var albumCellViewModel = AlbumCellViewModel($0)
            
            if let coordinator = coordinator {
                albumCellViewModel.onSelect = coordinator.onSelect
            }
            
            return .album(albumCellViewModel)
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
        case .album(let albumCellViewModel) :
            albumCellViewModel.didSelect()
        }
    }
}

