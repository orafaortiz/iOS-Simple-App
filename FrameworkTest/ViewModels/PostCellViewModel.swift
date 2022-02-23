//
//  PostCellViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import UIKit
import CoreData

struct PostCellViewModel {
    
    var postTitle: String? {
        post.title
    }
    
    var onSelect: (NSManagedObjectID) -> Void = { _ in }
    
    private let post: PostItem
    
    init (_ post: PostItem) {
        self.post = post
    }
    
    func didSelect() {
        
        onSelect(post.objectID)
    }
}
