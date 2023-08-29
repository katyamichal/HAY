//
//  ProductImageGalery.swift
//  HayBase
//
//  Created by Katya Michal on 07.08.2023.
//

import UIKit

final class ProductImageGaleryCell: UITableViewCell {
    
    
    // MARK: -  UIElements
    
    private let scrollView = UIScrollView()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        return pageControl
    }()
    
    private let verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.alignment = .center
        stackView.backgroundColor = UIColor.productDescription
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 40, left: 20, bottom: 40, right: 20)
        return stackView
    }()
    
    private  let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    #warning("count of images * 32")
    @objc
    private func pageControlDidChange(_ sender: UIPageControl) {
        let current = CGFloat(sender.currentPage)
        scrollView.setContentOffset(CGPoint(x: current * (Layout.width), y: 0), animated: true)
    }
    
    // MARK: - Inits
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .hayMain
        setupViews()
        setupConstraints()
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup' methods
    
    private func setupScrollView() {
        scrollView.frame = CGRect(x: .zero, y: .zero, width: Layout.width, height: Layout.height / 2)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureViews(with images: [String], detail: String) {
        
        pageControl.numberOfPages = images.count
        
        scrollView.contentSize = CGSize(width: ((Layout.width - 32) * CGFloat(Float(images.count))), height: scrollView.frame.size.height)
        
        for index in 0..<images.count {
            
            let page = UIImageView(frame: CGRect(
                x: (CGFloat(index) * (Layout.width - 32)),
                y: 0,
                width: Layout.width - 32,
                height: scrollView.frame.size.height))
           
            page.contentMode = .scaleAspectFill
            page.layer.masksToBounds = true
            page.image = UIImage(named: images[index])
            scrollView.addSubview(page)
            
        }
    }
    
    // MARK: - Setup methods

    private func setupViews() {
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(productNameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
      
        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            scrollView.heightAnchor.constraint(equalToConstant: Layout.height / 2),
            
            pageControl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            pageControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 10),
            
            
            
            verticalStackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
            
        ])
    }
    
    // MARK: -
    
    override func prepareForReuse() {
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
    }

    // MARK: - Public

    
    func update(with product: LocaleProduct, images: [String]) {
        productNameLabel.text = product.productName.uppercased()
        descriptionLabel.text = product.description
        
        configureViews(with: images, detail: product.description)
        
        if images.count  == 1 {
            pageControl.isHidden = true
        }
    }
}


extension ProductImageGaleryCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}


