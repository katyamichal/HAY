//
//  ProductInfoCell.swift
//  HayBase
//
//  Created by Katya Michal on 08.08.2023.
//

import UIKit


final class ProductInfoCell: UITableViewCell {
    
    private var infoType: [String] = ["Material", "Size", "Colour", "Price"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private let verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 16, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    
    private let infoTypeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    
    private let infolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()

    
    // MARK: - Public
    func update(with productInfo: [String], infoTypeIndex: Int) {
        
        infoTypeLabel.text = (infoType[infoTypeIndex] + ":").uppercased()

        // TODO: - Clean up
        if infoType[infoTypeIndex] == "Price" {
            infolLabel.text = (productInfo[infoTypeIndex] + " £").uppercased()
        } else {
            infolLabel.text = (productInfo[infoTypeIndex]).uppercased()
        }
    }
}

// MARK: - Setups

extension ProductInfoCell {
    
    private func setupViews() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(infoTypeLabel)
        verticalStackView.addArrangedSubview(infolLabel)
    }
    
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}