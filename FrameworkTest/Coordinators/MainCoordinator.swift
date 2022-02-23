//
//  MainCoordinator.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import UIKit
import CoreData

final class MainCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    var onSaveEvent = {}
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController: MainViewController = .instantiate()
        let mainViewModel = MainViewModel()
        mainViewModel.coordinator = self
        onSaveEvent = mainViewModel.reload
        mainViewController.viewModel = mainViewModel
        navigationController.setViewControllers([mainViewController], animated: false)
    }
    
    func onSelect(_ item: MainMenuItems) {
        // trigger child coordinator
        
        switch item {
        case .posts:
            
            let postsCoordinator = PostsCoordinator(navigationController: navigationController)
            postsCoordinator.parentCoordinator = self
            childCoordinators.append(postsCoordinator)
            postsCoordinator.start()
            
        case .albums:
            
            let albumsCoordinator = AlbumsCoordinator(navigationController: navigationController)
            albumsCoordinator.parentCoordinator = self
            childCoordinators.append(albumsCoordinator)
            albumsCoordinator.start()
            
        case .todos:
            print(item.rawValue)
        }
        
        
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        
        //print(CoreDataManager().fetchEvents().first?.name)
        
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
