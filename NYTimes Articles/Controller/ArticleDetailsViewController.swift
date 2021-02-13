//
//  ArticleDetailsViewController.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 12/02/2021.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    var article: Article?
    
    let _view = ArticleDetailsView()
    
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
    
    override func loadView() {
        super.loadView()
        _view.updateViews(withArticle: article)
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navLabel = UILabel()
        let navTitle = NSMutableAttributedString(string: article?.source?.rawValue ?? "", attributes:[
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.light),
                                                    NSAttributedString.Key.foregroundColor: UIColor.white])
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }
    
    
}
