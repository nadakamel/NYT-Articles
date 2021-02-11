//
//  ArticlesViewController.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import UIKit

class ArticlesViewController: UIViewController {

    let viewModel = ViewModel()
    private var period = 1
    static let segmentedControlItems = ["1 day", "7 days", "30 days"]
    
    private let segmentedControlView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: segmentedControlItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .yellow
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    private let articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = 15
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControlView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: segmentedControlView.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: segmentedControlView.bottomAnchor),
            
            articlesTableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 16),
            articlesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            articlesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            articlesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupTableView() {
        articlesTableView.register(ArticlesTableViewCell.self,
                                   forCellReuseIdentifier: ArticlesTableViewCell.identifier)
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        articlesTableView.backgroundColor = .black
        
        segmentedControlView.addSubview(segmentedControl)
        [segmentedControlView, articlesTableView].forEach {
            view.addSubview($0)
        }
        setupViewsConstraints()
    }
    
    override func loadView() {
        super.loadView()
        setupTableView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
        
        viewModel.delegate = self
        viewModel.loadPopularMovies(period: period)
    }

    @objc private func segmentedValueChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            period = 1
        case 1:
            period = 7
        default:
            period = 30
        }
        viewModel.loadPopularMovies(period: period)
    }

}

extension ArticlesViewController: ViewModelProtocol {
    func didUpdatePopularArticles() {
        articlesTableView.reloadData()
    }
}
