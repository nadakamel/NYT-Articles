//
//  ArticleDetailsViewController.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 12/02/2021.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    var article: Article?
    
    init(with article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        debugPrint("deallocated: \(self)")
    }
    
    private func setupUI() {
        
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(article?.title ?? "")
    }
    
}
