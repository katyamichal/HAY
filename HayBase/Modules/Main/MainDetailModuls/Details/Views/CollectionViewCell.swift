//
//  CollectionViewCell.swift
//  HayBase
//
//  Created by Katya Michal on 26.07.2023.
//

import UIKit

final class InspirationDetailCell: UICollectionViewCell {
  
    static let cellIdentifier = "InspirationDetailCell"
    
    // MARK: -  UIElements
    
    let scrollView = UIScrollView()
    
    
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
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 40, right: 30)
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
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    @objc
    private func pageControlDidChange(_ sender: UIPageControl) {
        let current = CGFloat(sender.currentPage)
        scrollView.setContentOffset(CGPoint(x: current * (Layout.width), y: 0), animated: true)
    }
    
    // MARK: - Inits
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
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

    private func configureViews(with inspirationFeed: LocaleInspirationFeed) {
        
        let images = inspirationFeed.images
        
        pageControl.numberOfPages = inspirationFeed.images.count
        
        scrollView.contentSize = CGSize(width: Layout.width * CGFloat(Float(images.count)), height: scrollView.frame.size.height)
        
       
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        for index in 0..<images.count {
            
            let page = UIImageView(frame: CGRect(
                x: CGFloat(index) * Layout.width,
                y: 0,
                width: Layout.width,
                height: scrollView.frame.size.height))
      
            page.contentMode = .scaleToFill
            page.image = UIImage(named: images[index])
           
            scrollView.addSubview(page)
        }
    }
    
    
    private func setupViews() {
   
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(productNameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)
       
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: Layout.height / 2),
         

            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            pageControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),

            verticalStackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    
    func update(with inspirationFeed: LocaleInspirationFeed) {
        productNameLabel.text = inspirationFeed.collectionName.uppercased()
        descriptionLabel.text = inspirationFeed.description
        configureViews(with: inspirationFeed)
        if inspirationFeed.images.count  == 1 {
            pageControl.isHidden = true
        }
    }
}


extension InspirationDetailCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
