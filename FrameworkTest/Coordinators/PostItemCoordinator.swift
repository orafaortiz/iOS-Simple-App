//
//  PostItemCoordinator.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import UIKit
import CoreData

final class PostItemCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController
    private let postID: NSManagedObjectID
    var parentCoordinator: PostsCoordinator?
    
    init(postID: NSManagedObjectID, navigationController: UINavigationController) {
        self.postID = postID
        self.navigationController = navigationController
    }
    
    func start() {
        
        let postItemViewController : PostItemViewController = .instantiate()
        let postItemViewModel = PostItemViewModel(postID: postID)
        postItemViewModel.coordinator = self
        postItemViewController.viewModel = postItemViewModel
        navigationController.pushViewController(postItemViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

