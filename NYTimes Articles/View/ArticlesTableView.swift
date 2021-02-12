//
//  ArticlesTableView.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 11/02/2021.
//

import UIKit

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.popularArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.identifier,
                                                 for: indexPath) as! ArticlesTableViewCell
        cell.backgroundColor = .black
        cell.configure(with: viewModel.popularArticles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = ArticleDetailsViewController(with: viewModel.popularArticles[indexPath.row])
        navigationController?.pushViewController(viewController, animated: false)
    }
    
}
