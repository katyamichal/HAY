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


final class MainTableView: UITableView, UIScrollViewDelegate {
    
    let tableHeader = InspirationTableHeader()
    
    func update(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    var viewModel: MainViewModel? {
        didSet {
            self.reloadData()
            guard let inspiration = viewModel?.inspiration, !inspiration.isEmpty else {return}
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
            return viewModel?.designers.count ?? 0

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = ProductSection.allCases[indexPath.section]
        
        switch section {

        case .popular:
            let cell = tableView.dequeue(indexPath) as ProductCell
            let products = viewModel?.popularProduct ?? []
            cell.update(products)
            return cell
            
        case .designer:
            let cell = tableView.dequeue(indexPath) as DesignerCollaborationCell
            guard let designers = viewModel?.designers, !designers.isEmpty else {
                return cell
            }
            cell.update(designers[indexPath.row])
            return cell
        
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = self.tableHeaderView as? InspirationTableHeader else {return}
        header.scrollViewDidScroll(self)
    }
    
}
extension MainTableView: UITableViewDelegate {}
