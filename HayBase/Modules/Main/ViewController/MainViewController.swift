//
//  ViewController.swift
//  HayBase
//
//  Created by Katya Michal on 05.07.2023.
//

import UIKit

final class MainViewController: UIViewController, InspirationTableHeaderDelegate {
    
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
        mainView.productTableView.tableHeader.delegate = self
        fetchData()
        mainView.productTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func fetchData() {
        mainViewModel.fetchModels()
        
        mainViewModel.onDidUpdatedViewModel =  {
            self.mainView.productTableView.update(self.mainViewModel)
            
        }
    }
    
    // navigate to inspirationcontroller from delegate
    // MARK: - Delegate method
    
    
    func inspirtionView(_ header: InspirationTableHeader, didSelectInspiration feed: InspirationFeed) {
        
        //TODO: - generic  detail controller
        let inspirationDetailModel = InspoDetailViewModel(inpirationFeed: feed)
        
        let inspoDetailVC = InspirationDetailViewController(viewModel: inspirationDetailModel)
        
        navigationController?.pushViewController(inspoDetailVC, animated: true)
    }
    
    /// delegate
}

extension MainViewController: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let product = mainViewModel.popularProduct[indexPath.item]
//        
//        guard indexPath.section == 0 else { return }
//        
//        let productDetailViewModel = ProductDetailViewModel(product: product)
//        let productDetailVC = ProductDetailViewController(viewModel: productDetailViewModel)
//        
//        navigationController?.pushViewController(productDetailVC, animated: true)
//    }
    
    
}

