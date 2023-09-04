//
//  TotalCell.swift
//  HayBase
//
//  Created by Katya Michal on 31.08.2023.
//

import UIKit

final class TotalCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "total"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .black
        return label
    }()

    
    // MARK: - Inits

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TotalCell {
    
    private func setupViews() {
        contentView.addSubview(headerLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        
        ])
    }
}
