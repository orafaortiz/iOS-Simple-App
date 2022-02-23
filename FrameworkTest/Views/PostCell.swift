//
//  PostCell.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import UIKit

final class PostCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    
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
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel.textColor = .darkText
    }
    
    private func setupHierarchy() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        titleLabel.pinToSuperviewEdges([.left, .top, .right, .bottom], constant: 20)
    }
    
    func update(with viewModel: PostCellViewModel) {
        
        titleLabel.text = viewModel.postTitle
    }
}

