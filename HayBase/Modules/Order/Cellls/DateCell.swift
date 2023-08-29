//
//  DateCell.swift
//  HayBase
//
//  Created by Katya Michal on 29.08.2023.
//

import UIKit

final class DateCell: UITableViewCell {

    // MARK: - UI Elements
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7 september"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let productsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
   
        collection.register(OrderProductsCollectionCell.self, forCellWithReuseIdentifier: OrderProductsCollectionCell.cellIdentifier)
        

        collection.backgroundColor = .clear
        return collection
    }()
    
    
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        productsCollectionView.dataSource = self
        backgroundColor = .clear
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension DateCell {
    
    private func setupViews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(productsCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
        
        productsCollectionView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
        productsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
       productsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        productsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        productsCollectionView.heightAnchor.constraint(equalToConstant: 70)
        
        ])
    }
}


extension DateCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderProductsCollectionCell.cellIdentifier, for: indexPath) as? OrderProductsCollectionCell else {
            fatalError("Order Product Collection Cell")
        }
        return cell
    }
}
