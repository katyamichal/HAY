//
//  SeatingProductTableView.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.
//

import UIKit


protocol MainTableViewDelegate: AnyObject {
    func didSelectProduct(product: LocaleProduct)
    func didSelectDesignerCell(designer: LocaleDesigner)
    func didChangeLocalProduct(product: LocaleProduct)
}



enum ProductSection: CaseIterable {
    case popular
    case designer
}


final class MainTableView: UITableView, UIScrollViewDelegate {
    
    // MARK: - Delegate

    weak var selectionDelegate: MainTableViewDelegate?
   
    
    // MARK: - Header

    let tableHeader = InspirationTableHeader()
     
    
    // MARK: - View Model

    var viewModel: MainViewModel? {
        didSet {
            self.reloadData()
            guard let inspiration = viewModel?.localInspiration, !inspiration.isEmpty else { return }
            
            self.tableHeader.update(with: inspiration)
        }
    }
    
    
    // MARK: - Inits
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        
        self.backgroundColor = .clear
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.delegate = self
        self.dataSource = self
        
        self.showsVerticalScrollIndicator = false
        self.separatorStyle = .none
        self.contentInsetAdjustmentBehavior = .never
        
        tableHeader.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: Layout.height / 1.75)
        self.tableHeaderView = tableHeader
        self.tableHeaderView?.isUserInteractionEnabled = true
        
        self.register(ProductCell.self)
        self.register(DesignerCell.self)
        
        //Loading Cell
        self.register(LoadingDesignerCell.self)
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
        case .popular, .designer:
            return 1
  
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
          
            cell.onLocalProductDidChanged = { product in
                self.selectionDelegate?.didChangeLocalProduct(product: product)
            }
            
            return cell
            
        case .designer:
            
            guard let designers = viewModel?.localDesigners, !designers.isEmpty else {
                let cell = tableView.dequeue(indexPath) as LoadingDesignerCell
                return cell
            }
            
            let cell = tableView.dequeue(indexPath) as DesignerCell
            cell.update(designers[indexPath.row])
            cell.collectionView.delegate = self
            cell.onLocalProductDidChanged = { product in
                self.selectionDelegate?.didChangeLocalProduct(product: product)
            }
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sections = ProductSection.allCases[indexPath.section]
        switch sections {
        case .popular:
            break
        case .designer:
            guard let designers = viewModel?.localDesigners else {return}
            let selected = designers[indexPath.item]
            selectionDelegate?.didSelectDesignerCell(designer: selected)
        }
    }
}
// MARK: - Popular Product Collection Delegate

extension MainTableView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let section = collectionView.cellForItem(at: indexPath)
           
        switch section {
        case section as ProductCollectionCell:
            guard let products = viewModel?.popularLocaleProduct else {return}
            let product = products[indexPath.item]
            selectionDelegate?.didSelectProduct(product: product)
        case section as DesignerProductsCell:
            // here not sure
            guard let designer = viewModel?.localDesigners[indexPath.section]
            else {return}
            let product = designer.products[indexPath.item]
            selectionDelegate?.didSelectProduct(product: product)
        default:
            break
        }
    }
}
