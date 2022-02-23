//
//  AlbumCellViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import UIKit
import CoreData

struct AlbumCellViewModel {
    
    var albumTitle: String? {
        album.title
    }
    
    var onSelect: (NSManagedObjectID) -> Void = { _ in }
    
    private let album: AlbumItem
    
    init (_ album: AlbumItem) {
        self.album = album
    }
    
    func didSelect() {
        
        onSelect(album.objectID)
    }
}
