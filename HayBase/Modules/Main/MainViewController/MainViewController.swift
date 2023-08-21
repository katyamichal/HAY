//
//  ViewController.swift
//  HayBase
//
//  Created by Katya Michal on 05.07.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainViewModel: MainViewModel
    
    private var mainView: MainView { return self.view as! MainView }
    
    // MARK: - Init
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// inittial fetching
        fetchData()
        
        ///delegates
        mainView.mainTableView.selectionDelegate = self
        mainView.mainTableView.tableHeader.delegate = self
        
        
        /// trigger when favourite products has been changed(all modules)
        ProductArchiver.onFavouriteProductChanged = { [weak self] in
            self?.mainViewModel.update()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
     private func fetchData() {
        mainViewModel.fetchModels()
        
        mainViewModel.onUpdatedModel =  {
            self.mainView.mainTableView.update(self.mainViewModel)
        }
    }
}
// MARK: - Delegate methods
extension MainViewController: InspirationTableHeaderDelegate {
    
    func inspirationView(_ header: InspirationTableHeader, didSelectInspiration feed: LocaleInspirationFeed) {

        let inspirationDetailModel = InspoDetailViewModel(inpirationFeed: feed)
        let inspoDetailVC = InspirationDetailViewController(viewModel: inspirationDetailModel)

        navigationController?.pushViewController(inspoDetailVC, animated: true)
    }
}


extension MainViewController: MainTableViewDelegate {
    
    func didChangeLocalProduct(product: LocaleProduct) {
        mainViewModel.update(product: product)
    }
    
    
    #warning("finish")
    func didSelectDesignerCell(designer: LocaleDesigner) {}
    
   /// shows detail view for single product

    func didSelectProduct(product: LocaleProduct) {
        let productDetailViewModel = ProductDetailViewModel(product: product)
        let productDetailVC = ProductDetailViewController(viewModel: productDetailViewModel)
        
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
