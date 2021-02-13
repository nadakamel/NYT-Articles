//
//  MostPopularArticlesView.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 12/02/2021.
//

import UIKit

protocol MostPopularArticlesViewDelegate: class {
    func loadPopularArticles(withPeriod period: Int)
}

class MostPopularArticlesView: UIView {

    weak var delegate: MostPopularArticlesViewDelegate?
    
    var selectedPeriod: Int = 1
    
    static private let segmentedControlItems = ["1 day", "7 days", "30 days"]
    
    fileprivate let segmentedControlView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: segmentedControlItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .yellow
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    let articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = 15
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var emptyTableViewLabel: UILabel = {
        let label = UILabel(frame: articlesTableView.frame)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = UIColor.darkGray
        label.text = "No articles found"
        return label
    }()
    
    let refreshControl = UIRefreshControl()
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupViewsConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControlView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: segmentedControlView.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: segmentedControlView.bottomAnchor),
            
            articlesTableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 16),
            articlesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            articlesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            articlesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupUI() {
        self.backgroundColor = .black
        articlesTableView.backgroundColor = .black
        
        segmentedControlView.addSubview(segmentedControl)
        [segmentedControlView, articlesTableView].forEach {
            self.addSubview($0)
        }
        setupViewsConstraints()
    }

    @objc private func refreshData(_ sender: Any) {
        delegate?.loadPopularArticles(withPeriod: selectedPeriod)
    }
    
    private func setupTableView() {
        articlesTableView.register(ArticlesTableViewCell.self,
                                   forCellReuseIdentifier: ArticlesTableViewCell.identifier)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        articlesTableView.addSubview(refreshControl)
    }
    
    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        articlesTableView.backgroundView = spinner
        
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTableView()
        setupSpinner()
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func segmentedValueChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            selectedPeriod = 1
        case 1:
            selectedPeriod = 7
        default:
            selectedPeriod = 30
        }
        delegate?.loadPopularArticles(withPeriod: selectedPeriod)
    }
    
    
}
