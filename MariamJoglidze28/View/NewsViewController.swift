//
//  ViewController.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import UIKit

class NewsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    private var apiManager: APIManagerProtocol!
    private var viewModel: ArticleViewModelProtocol!
    private var dataSource: NewsDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout() {
        navigationItem.title = "News"
        tableView.registerNib(class: NewsCell.self)
    }

    private func configureViewModel() {
        apiManager = APIManager()
        viewModel = ArticleViewModel(with: apiManager,
                                      navigationController: self.navigationController)
        dataSource = NewsDataSource(with: tableView,
                                    viewModel: viewModel)
        
        dataSource.refresh()
    }
    

}

