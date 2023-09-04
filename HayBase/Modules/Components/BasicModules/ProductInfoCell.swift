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
        contentView.backgroundColor = Colours.Main.hayBackground
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
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    
    private let infoTypeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .black
        return label
    }()
    
    
    private let infolLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        return label
    }()

    
    // MARK: - Public
    func update(with productInfo: [String], infoTypeIndex: Int) {
        
        infoTypeLabel.text = (infoType[infoTypeIndex] + ":").uppercased()

        // TODO: - Clean up
        if infoType[infoTypeIndex] == "Price" {
            infolLabel.text = ("£" + productInfo[infoTypeIndex]).lowercased()
        } else {
            infolLabel.text = (productInfo[infoTypeIndex]).lowercased()
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
