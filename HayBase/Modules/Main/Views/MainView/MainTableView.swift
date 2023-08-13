//
//  SeatingProductTableView.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.
//

import UIKit


enum ProductSection: CaseIterable {
    case popular
    case designer
}

protocol MainTableViewDelegate: AnyObject {
    func didSelectProduct(product: LocalProduct)
}

final class MainTableView: UITableView, UIScrollViewDelegate {
    
    let tableHeader = InspirationTableHeader()
    
    weak var selectionDelegate: MainTableViewDelegate?
    
    func update(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    var viewModel: MainViewModel? {
        didSet {
            self.reloadData()
            guard let inspiration = viewModel?.localInspiration, !inspiration.isEmpty else {return}
            self.tableHeader.update(with: inspiration)
        }
    }
    // MARK: - Inits
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.delegate = self
        self.dataSource = self
        
        
        self.showsVerticalScrollIndicator = false
        self.allowsSelection = false
        self.separatorStyle = .none
        self.contentInsetAdjustmentBehavior = .never
        
        tableHeader.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: Layout.height / 1.75)
        self.tableHeaderView = tableHeader
        self.tableHeaderView?.isUserInteractionEnabled = true
        
        
        
        self.register(ProductCell.self)
        self.register(DesignerCollaborationCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Delegate and Data Source

extension MainTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProductSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = ProductSection.allCases[section]
        
        switch section {
            
        case .popular:
            return 1
            
        case .designer:
            return viewModel?.localDesigners.count ?? 0
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = ProductSection.allCases[indexPath.section]
        
        switch section {
            
        case .popular:
            let cell = tableView.dequeue(indexPath) as ProductCell
            let products = viewModel?.popularLocaleProduct ?? []
            cell.update(products)
            cell.collectionView.delegate = self
            return cell
            
        case .designer:
            let cell = tableView.dequeue(indexPath) as DesignerCollaborationCell
            guard let designers = viewModel?.localDesigners, !designers.isEmpty else {
                return cell
            }
            cell.update(designers[indexPath.row])
            return cell
        }
    }
}

// MARK: - Delegate methods

extension MainTableView: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = self.tableHeaderView as? InspirationTableHeader else {return}
        header.scrollViewDidScroll(self)
    }
}

extension MainTableView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let products = viewModel?.popularLocaleProduct else {return}
        let product = products[indexPath.item]
        selectionDelegate?.didSelectProduct(product: product)
    }
}

