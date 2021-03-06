//
//  ArticlesViewController.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import UIKit

class ArticlesViewController: UIViewController {

    let _view = MostPopularArticlesView()
    let viewModel = ArticlesViewModel()
    
    private var period = 1
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        debugPrint("deallocated: \(self)")
    }
    
    override func loadView() {
        super.loadView()
        view = _view
    }
    
    fileprivate func setNavigationTitleView() {
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: "NY Times ", attributes:[
                                                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22.0),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white])
        navTitle.append(NSMutableAttributedString(string: "Most Popular Articles", attributes:[
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.light),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white]))
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitleView()
        
        _view.articlesTableView.delegate = self
        _view.articlesTableView.dataSource = self
        _view.delegate = self
        
        viewModel.delegate = self
        viewModel.loadPopularArticles(period: period)
    }
    
    func showAlert(title: String?, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}

extension ArticlesViewController: MostPopularArticlesViewDelegate {
    func loadPopularArticles(withPeriod period: Int) {
        _view.refreshControl.endRefreshing()
        viewModel.loadPopularArticles(period: period)
    }
}

extension ArticlesViewController: ArticlesViewModelProtocol {
    func didUpdatePopularArticles(withStatus status: Status) {
        switch status {
        case .failure(let error):
            _view.emptyTableViewLabel.text = error
            _view.articlesTableView.backgroundView = _view.emptyTableViewLabel
            showAlert(title: error)
        default:
            _view.articlesTableView.backgroundView = nil
        }
        _view.articlesTableView.reloadData()
    }
}
