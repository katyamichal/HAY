//
//  Header.swift
//  HayBase
//
////  Created by Catarina Polakowsky on 13.07.2023.
////
//
import UIKit
//
final class Header: UIView {

    private var inspirationFeed: [InspirationFeed] = []
    private  var pages: [InspirationView] = []
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    private let scrollView = UIScrollView()
    //
    private var scrollViewHeight = NSLayoutConstraint()
    private var scrollViewBottom = NSLayoutConstraint()
    
    private var container = UIView()
    private var containerHeight = NSLayoutConstraint()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = inspirationFeed.count
        pageControl.pageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        return pageControl
    }()
    
   
  private func setupScrollViewPages(with inspiration: [InspirationFeed]) {
      #warning("Clean up the guard statement")
        guard !inspiration.isEmpty, pages.isEmpty else { return }
        
        scrollView.frame = CGRect(x: .zero, y: .zero, width: Layout.width, height: Layout.height / 1.75)
        scrollView.contentSize = CGSize(width: Layout.width * CGFloat(Float(inspiration.count)), height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = inspiration.count
        
        for index in 0..<inspiration.count {
            let page = InspirationView(frame: CGRect(
                
                x: CGFloat(index) * Layout.width,
                y: 0,
                width: Layout.width,
                height: scrollView.frame.size.height))
            
            page.update(with: inspiration[index])
            scrollView.addSubview(page)
            pages.append(page)
        }
    }

    
    @objc
    private func pageControlDidChange(_ sender: UIPageControl) {
        let current = CGFloat(sender.currentPage)
        scrollView.setContentOffset(CGPoint(x: current * (Layout.width), y: 0), animated: true)
    }
    
    // MARK: - Public method
    func update(with inspiration: [InspirationFeed]) {
        self.inspirationFeed = inspiration
        setupScrollViewPages(with: inspiration)
    }
    
    
    // MARK: - Setups methods
    
    private func setupViews() {
        addSubview(container)
        container.addSubview(scrollView)
        container.addSubview(pageControl)
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            pageControl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 70),
            pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -15),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            
            widthAnchor.constraint(equalTo: container.widthAnchor),
            heightAnchor.constraint(equalTo: container.heightAnchor),
            centerXAnchor.constraint(equalTo: container.centerXAnchor),
            centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
        ])

        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerHeight = container.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerHeight.isActive = true

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewBottom = scrollView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        scrollViewBottom.isActive = true
        scrollViewHeight = scrollView.heightAnchor.constraint(equalTo: container.heightAnchor)
        scrollViewHeight.isActive = true
        scrollView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
    }
    
    
}

// MARK: - Magic goes here

extension Header: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        guard !pages.isEmpty else {return}
        
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        
        if offsetY <= 0 && scrollView.contentOffset.x > 0 {
            pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
        }
        
        containerHeight.constant = scrollView.contentInset.top
        container.clipsToBounds = offsetY <= 0
        scrollViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        pages[pageControl.currentPage].imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
//
