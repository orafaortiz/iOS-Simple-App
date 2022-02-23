//
//  TodosViewController.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import UIKit

class TodosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: TodosViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
    }
    
    private func setupViews() {
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoCell.self, forCellReuseIdentifier: "TodoCell")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
}

extension TodosViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.cell(at: indexPath) {
        case .todo(let todoCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
            cell.update(with: todoCellViewModel)
            return cell
        }
    }
}

extension TodosViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}


