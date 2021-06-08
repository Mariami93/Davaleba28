//
//  NewsDataSource.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import UIKit

class NewsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var viewModel: ArticleViewModelProtocol!
    private var newsViewModels = [NewsViewModel]()
    
    init(with tableView: UITableView, viewModel: ArticleViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchNewses { viewModels in
            self.newsViewModels.append(contentsOf: viewModels)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(NewsCell.self, for: indexPath)
        cell.configure(with: newsViewModels[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.proceedToDetails(using: newsViewModels[indexPath.row])
//    }
}

