//
//  AlbumsCoordinator.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import UIKit
import CoreData

final class AlbumsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private let navigationController : UINavigationController
    var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        // create posts view controller
        let albumsViewController : AlbumsViewController = .instantiate()
        // posts view model
        let albumsViewModel = AlbumsViewModel()
        albumsViewModel.coordinator = self
        albumsViewController.viewModel = albumsViewModel
        // push it onto navigation controller
        navigationController.pushViewController(albumsViewController, animated: true)
    }
    
    func onSelect(_ id: NSManagedObjectID) {
        
//        let postItemCoordinator = PostItemCoordinator(postID: id, navigationController: navigationController)
//        postItemCoordinator.parentCoordinator = self
//        childCoordinators.append(postItemCoordinator)
//        postItemCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        
        //print(CoreDataManager().fetchEvents().first?.name)
        
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    
}
