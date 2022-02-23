//
//  PostItemViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import CoreData
import UIKit

final class PostItemViewModel {
    
    private let postID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var post: PostItem?
    //private let date = Date()
    var onUpdate = {}
    var coordinator: PostItemCoordinator?
    
    var postTitle: String? {
        guard let title = post?.title else { return nil }
        return title
    }
    
    var postBody: String? {
        guard let body = post?.body else { return nil }
        return body
    }
    
    init(postID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared) {
        self.postID = postID
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        
        post = coreDataManager.getPost(postID)
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
}


