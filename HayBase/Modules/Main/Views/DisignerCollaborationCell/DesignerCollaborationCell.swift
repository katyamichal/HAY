//
//  DesignerCollaborationCell.swift
//  HayBase
//
//  Created by Katya Michal on 08.07.2023.
//

import UIKit

final class DesignerCollaborationCell: UITableViewCell {
    
    private var designer: LocaleDesigner?
    var onLocalProductDidChanged: ((LocaleProduct)->())?
    
    // MARK: - UI Elements
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "HAY × Designers"
        label.textColor = .black
        return label
    }()
    // MARK: - Designer Description
    
    private let designerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 21, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private let collaborationName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        return label
    }()
    
    let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 3, bottom: 0, trailing: 3)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    // MARK: - Designer StackView
    
    private let designerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let designerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    // MARK: - Collection View
    
     lazy var collectionView: UICollectionView = {
 
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Layout.width * 0.5, height: Layout.width * 0.7)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
         
        collection.register(DesignerProductsCell.self, forCellWithReuseIdentifier: DesignerProductsCell.cellIdentifier)
       
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func update(_ designer: LocaleDesigner) {
        
        designerNameLabel.text = designer.designerName.capitalized
        collaborationName.text = designer.collectionName.capitalized
        designerImageView.image = UIImage(named: "\(designer.designerImage)")
        
        self.designer = designer
        collectionView.reloadData()
    }
}


// MARK: - Setup methods

extension DesignerCollaborationCell {
    private func setupViews() {
        //1
        contentView.addSubview(containerView)
        containerView.addSubview(headerLabel)
        //2
        containerView.addSubview(designerStackView)
        designerStackView.addArrangedSubview(designerImageView)
        designerStackView.addArrangedSubview(descriptionStackView)
        //3
        descriptionStackView.addArrangedSubview(designerNameLabel)
        descriptionStackView.addArrangedSubview(collaborationName)
        //4
        containerView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 600),


          
            headerLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            headerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

       
            designerStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            designerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            designerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

     
            collectionView.topAnchor.constraint(equalTo: designerStackView.bottomAnchor, constant: -25),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: designerStackView.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

     
            designerImageView.widthAnchor.constraint(equalToConstant: Layout.width * 0.65),
            designerImageView.heightAnchor.constraint(equalToConstant: Layout.width * 0.7),
        ])
    }
}

// MARK: - Collection Data Source

extension DesignerCollaborationCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return designer?.products.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DesignerProductsCell.cellIdentifier, for: indexPath) as? DesignerProductsCell else {
            fatalError()
        }
        
        guard let products = designer?.products, !products.isEmpty,
            let product = designer?.products[indexPath.item] else {return cell}
        cell.update(product)
        cell.likeButton.onLikeButtonTapped = { isLiked, product in
            self.onLocalProductDidChanged?(product)
        }
        return cell
     
    }
}

