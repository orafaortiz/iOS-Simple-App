//
//  PostItemViewController.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import UIKit

final class PostItemViewController: UIViewController {

    var viewModel: PostItemViewModel!
    
    @IBOutlet weak var postTitleLabel: UITextView!
    @IBOutlet weak var postContentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.postTitle
        navigationController?.navigationBar.prefersLargeTitles = true

        viewModel.onUpdate = { [weak self] in
            guard let self = self else { return }
            self.postTitleLabel.text = self.viewModel.postTitle
            self.navigationItem.title = self.viewModel.postTitle
            self.postContentTextView.text = self.viewModel.postBody
        }
        
        viewModel.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }

}
