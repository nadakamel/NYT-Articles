//
//  ViewController.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        viewModel.delegate = self
        viewModel.loadPopularMovies(period: 1)
    }


}

extension ViewController: ViewModelProtocol {
    func didUpdatePopularArticles() {
        print(viewModel.popularArticles)
    }
}
