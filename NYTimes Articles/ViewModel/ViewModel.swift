//
//  ViewModel.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import Foundation

protocol ViewModelProtocol: class {
    func didUpdatePopularArticles()
}

class ViewModel {
    weak var delegate: ViewModelProtocol?
    
    fileprivate(set) var popularArticles: [Article] = []
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadPopularMovies(period: Int) {
        networkManager.fetchPopularArticles(period: period, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let popularArticlesResponse):
                if let popularArticles = popularArticlesResponse.results {
                    strongSelf.popularArticles = popularArticles
                    strongSelf.delegate?.didUpdatePopularArticles()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
}
