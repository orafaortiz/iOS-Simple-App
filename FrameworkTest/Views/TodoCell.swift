//
//  TodoCell.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import UIKit

final class TodoCell: UITableViewCell {
    
    private let todoTitle = UILabel()
    private let stackView = UIStackView()
    private let checkView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        stackView.axis = .horizontal
        [stackView, todoTitle, checkView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        stackView.spacing = 15
        
        checkView.contentMode = .left
        
        todoTitle.font = .systemFont(ofSize: 18, weight: .medium)
        todoTitle.textColor = .darkText
        todoTitle.numberOfLines = 2
    }
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(checkView)
        stackView.addArrangedSubview(todoTitle)
        stackView.addArrangedSubview(UIView())
    }
    
    private func setupLayout() {
        stackView.pinToSuperviewEdges([.left, .top, .right, .bottom], constant: 20)
    }
    
    func update(with viewModel: TodoCellViewModel) {
        let configImgDone = UIImage.SymbolConfiguration(textStyle: .body, scale: .medium)
        
        let imgDone = UIImage(systemName: "circle.fill", withConfiguration: configImgDone)
        let imgNotDone = UIImage(systemName: "circle", withConfiguration: configImgDone)
        
        if viewModel.todoCompleted == true {
            checkView.image = imgDone
            checkView.tintColor = .green
        } else {
            checkView.image = imgNotDone
            checkView.tintColor = .red
        }
        
        todoTitle.text = viewModel.todoTitle
        
    }
}
