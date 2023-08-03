//
//  HeaderCell.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 20.07.2023.
//

import UIKit

//class HeaderCell: UITableViewCell {
//
//    private var inspiration: [InspirationFeed] = []
//
//    private  var pages: [InspirationView] = []
//    
//    // MARK: - Inits
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//       
//        setupViews()
//        setupConstrains()
//        setupScrollView()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - UI Elements
//    private let scrollView = UIScrollView()
//
////    private var scrollViewHeight = NSLayoutConstraint()
////    private var scrollViewBottom = NSLayoutConstraint()
////
//    private var containerHeight = NSLayoutConstraint()
//
//    var maximum = 500
//    var minimum = 480
//    private lazy var container: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .tertiarySystemBackground
//        return view
//    }()
//
//    private lazy var pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.pageIndicatorTintColor = .white
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.currentPageIndicatorTintColor = .black
//        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
//        return pageControl
//    }()
//
//
//    private func setupScrollView() {
//        scrollView.frame = CGRect(x: .zero, y: .zero, width: Layout.width, height: 480)
//        scrollView.isPagingEnabled = true
//        scrollView.delegate = self
//        scrollView.showsHorizontalScrollIndicator = false
//    }
//
//    func update(with inspiration: [InspirationFeed]) {
//        self.inspiration = inspiration
//        setupScrollViewPages(with: inspiration)
//    }
//
//    func setupScrollViewPages(with inspiration: [InspirationFeed]) {
//        guard !inspiration.isEmpty else { return }
//
//        scrollView.contentSize = CGSize(width: Layout.width * CGFloat(Float(inspiration.count)), height: scrollView.frame.size.height)
//        pageControl.numberOfPages = inspiration.count
//
//        for index in 0..<inspiration.count {
//            let page = InspirationView(frame: CGRect(
//
//                x: CGFloat(index) * Layout.width,
//                y: 0,
//                width: Layout.width,
//                height: scrollView.frame.size.height))
//
//            page.update(with: inspiration[index])
//            scrollView.addSubview(page)
//            pages.append(page)
//        }
//    }
//
//    @objc
//    private func pageControlDidChange(_ sender: UIPageControl) {
//        let current = CGFloat(sender.currentPage)
//        scrollView.setContentOffset(CGPoint(x: current * (Layout.width), y: 0), animated: true)
//    }
//    // MARK: - Setups methodsd
//
//    private func setupViews() {
//        contentView.addSubview(container)
//        container.addSubview(scrollView)
//        container.addSubview(pageControl)
//    }
//
//    private func setupConstrains() {
//      
//        NSLayoutConstraint.activate([
//
//            container.topAnchor.constraint(equalTo: contentView.topAnchor),
//            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            container.widthAnchor.constraint(equalToConstant: Layout.width),
//           // container.heightAnchor.constraint(equalToConstant: 480),
//
//            pageControl.topAnchor.constraint(equalTo: container.topAnchor, constant: 70),
//            pageControl.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -15),
//            pageControl.heightAnchor.constraint(equalToConstant: 20),
//
//        ])
//        containerHeight = container.heightAnchor.constraint(equalToConstant: 480)
//        containerHeight.isActive = true
//    }
//}
//
//// MARK: - Magic goes here
//
//extension HeaderCell: UIScrollViewDelegate {
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//        guard !pages.isEmpty else {return}
//
//        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
//
//        if offsetY <= 0 && scrollView.contentOffset.x > 0 {
//            pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
//        }
// 
//        pages[pageControl.currentPage].imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
//    }
//}
//
