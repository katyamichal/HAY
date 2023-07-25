//
//  SecondSectionTableCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 06.07.2023.
//

//import UIKit
//

//
//struct Layout {
//    static let width = UIScreen.main.bounds.width
//}
//
//final class PopularProductTVCell: UITableViewCell {
//    
//    static var reuseID = "PopularProductTVCell"
//    
//    var products: [Product] = []
//    
//    // MARK: - UI Elements
//    
//    
//  private let headerLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 22, weight: .bold)
//        label.text = "Popular Products"
//        return label
//    }()
//    
//   private lazy var collectionView: UICollectionView = {
//       
//       let layout = UICollectionViewFlowLayout()
//       layout.itemSize = CGSize(width: Layouts.width * 0.8, height: Layouts.width * 0.7)
//       layout.scrollDirection = .horizontal
//       
//       let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//       collection.showsHorizontalScrollIndicator = false
//       collection.translatesAutoresizingMaskIntoConstraints = false
//       collection.delegate = self
//       collection.dataSource = self
//       collection.register(PopularProductCVCell.self, forCellWithReuseIdentifier: PopularProductCVCell.cellIdentifier)
//       // collection.backgroundColor = .red
//       return collection
//   }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//      
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Public
//    
//    func update(_ products: [Product]) {
//        self.products = products
//        
//    }
//}
//
//extension PopularProductTVCell {
//    private func setupViews() {
//        contentView.addSubview(headerLabel)
//        contentView.addSubview(collectionView)
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//        
//            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            
//            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 300)
//        ])
//    }
//}
//
//extension PopularProductTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return products.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularProductCVCell.cellIdentifier, for: indexPath) as? PopularProductCVCell else {
//            fatalError("Popular Collection Cell")
//        }
//        let product = products[indexPath.item]
//        cell.update(product)
//        
//        return cell
//    }
//}
//
