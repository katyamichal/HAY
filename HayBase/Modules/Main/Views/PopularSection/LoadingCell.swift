//
//  LoadingCell.swift
//  HayBase
//
//  Created by Katya Michal on 04.09.2023.
//

import UIKit

final class LoadingCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "LoadingCollectionCell"
    
    private let shimmeringView: ShimmeringView = {
        let view = ShimmeringView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shimmeringNameLabel: ShimmeringView = {
        let view = ShimmeringView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shimmeringPriceLabel: ShimmeringView = {
        let view = ShimmeringView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shimmeringButton: ShimmeringView = {
        let view = ShimmeringView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingCollectionCell {
    
    private func setupView() {
        contentView.addSubview(shimmeringView)
        contentView.addSubview(shimmeringNameLabel)
        contentView.addSubview(shimmeringPriceLabel)
        contentView.addSubview(shimmeringButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            shimmeringView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shimmeringView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shimmeringView.widthAnchor.constraint(equalToConstant: Layout.width * 0.6),
            shimmeringView.heightAnchor.constraint(equalToConstant: Layout.width * 0.6),
            
            shimmeringButton.topAnchor.constraint(equalTo: shimmeringView.bottomAnchor, constant: 16),
            shimmeringButton.trailingAnchor.constraint(equalTo: shimmeringView.trailingAnchor, constant: -1),
            shimmeringButton.widthAnchor.constraint(equalToConstant: 25),
            shimmeringButton.heightAnchor.constraint(equalToConstant: 25),
            
            shimmeringNameLabel.topAnchor.constraint(equalTo: shimmeringView.bottomAnchor, constant: 10),
            shimmeringNameLabel.trailingAnchor.constraint(equalTo: shimmeringButton.leadingAnchor, constant: -20),
            shimmeringNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shimmeringNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            shimmeringPriceLabel.topAnchor.constraint(equalTo: shimmeringNameLabel.bottomAnchor, constant: 8),
            shimmeringPriceLabel.trailingAnchor.constraint(equalTo: shimmeringButton.leadingAnchor, constant: -80),
            shimmeringPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shimmeringPriceLabel.heightAnchor.constraint(equalToConstant: 20)
    
        ])
    }
}
