//
//  AlbumCell.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 23/02/22.
//

import UIKit

final class AlbumCell: UITableViewCell {
    
    private let albumName = UILabel()
    
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
        
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.font = .systemFont(ofSize: 18, weight: .medium)
        albumName.textColor = .darkText
    }
    
    private func setupHierarchy() {
        contentView.addSubview(albumName)
    }
    
    private func setupLayout() {
        albumName.pinToSuperviewEdges([.left, .top, .right, .bottom], constant: 20)
    }
    
    func update(with viewModel: AlbumCellViewModel) {
        
        albumName.text = viewModel.albumTitle
    }
}
