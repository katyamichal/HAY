//
//  ViewController.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 05.07.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    let mainViewModel: MainViewModel 
 
    
    var mainView: MainView { return self.view as! MainView }
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
        fetchData()
    }
    
    private func fetchData() {
         mainViewModel.fetchModels()
        
        mainViewModel.onDidUpdatedViewModel =  {
            self.mainView.productTableView.update(self.mainViewModel)
        }
    }
    
}



