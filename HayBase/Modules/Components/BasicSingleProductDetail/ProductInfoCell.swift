//
//  ProductInfoCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 08.08.2023.
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
    
    private let horizontalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillProportionally
        // stackView.alignment = .firstBaseline
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 10, bottom: 16, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    
    private let infoTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.backgroundColor = .red
        
        return label
    }()
    
    
    private let infolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .light)
        
        return label
    }()
    //
    //    private var acView: UIView = {
    //        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 2))
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        view.layer.borderWidth = 2.0
    //        view.layer.borderColor = UIColor.black.cgColor
    //        return view
    //    }()
    
    
    // MARK: - Public
    func update(with productInfo: [String], infoTypeIndex: Int) {
        //        infoTypeLabel.text = infoType[infoTypeIndex] + ":"
        infolLabel.text = (infoType[infoTypeIndex] + ": " + productInfo[infoTypeIndex]).uppercased()
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        infoTypeLabel.text = nil
    }
}

// MARK: - Setups

extension ProductInfoCell {
    
    private func setupViews() {
        contentView.addSubview(horizontalStackView)
        
        // horizontalStackView.addArrangedSubview(infoTypeLabel)
        //          horizontalStackView.addArrangedSubview(acView)
        horizontalStackView.addArrangedSubview(infolLabel)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
