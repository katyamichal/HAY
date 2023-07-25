//
//  SeatingProductTableView.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 06.07.2023.
//

import UIKit


enum ProductSection: CaseIterable {
   // case scroll
//    case popular
    case designer
  //  case inspiration

}

final class MainTableView: UITableView, UIScrollViewDelegate {
    
    let tableHeader = Header()
    
    func update(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    var viewModel: MainViewModel? {
        didSet {
            guard let inspiration = viewModel?.inspiration, !inspiration.isEmpty else {return}
            self.tableHeader.update(with: inspiration)
            self.reloadData()
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
        
  
        //tableHeader.viewModel = viewModel
        
        
//        viewModel?.onInspirationFeed = { inspirationFeed in
//            tableHeader.inspirationFeed = inspirationFeed
//        }
       // self.register(HeaderCell.self)
       // self.register(ProductCell.self)
       // self.register(PopularProductTVCell.self)
        self.register(DesignerCollaborationCell.self)
     //   self.register(InsipationTableCell.self)
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
        //case .scroll:
     //       return 1
//        case .popular:
//            return 1
//
        case .designer:
            return 1
//
        
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = ProductSection.allCases[indexPath.section]
        
        switch section {
            
//        case .scroll:
//            let cell = tableView.dequeue(indexPath) as HeaderCell
//            let inspiration = viewModel?.inspiration ?? []
//            cell.update(with: inspiration)
//            return cell
//        case.popular:
//            let cell = tableView.dequeue(indexPath) as PopularProductTVCell
//            let products = viewModel?.products ?? []
//            cell.update(products)
//            return cell
            
        case .designer:
            let cell = tableView.dequeue(indexPath) as DesignerCollaborationCell
            guard let designers = viewModel?.designers, !designers.isEmpty else {
                return cell
            }
            cell.update(designers[indexPath.row])
            return cell
            
//        case .inspiration:
//            let cell = tableView.dequeue(indexPath) as InsipationTableCell
//            let inspirationFeed = viewModel?.inspirationFeed ?? []
//            cell.update(inspirationFeed[indexPath.row])
//            return cell
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard let header = self.tableHeaderView as? HeaderCell else {return}
//        header.scrollViewDidScroll(self)
        
        guard let header = self.tableHeaderView as? Header else {return}
        header.scrollViewDidScroll(self)
    }
    
    
 
    

}
extension MainTableView: UITableViewDelegate {

}
