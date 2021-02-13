//
//  ArticlesViewModel.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

enum Status {
    case success
    case failure(error: String)
}

protocol ArticlesViewModelProtocol: class {
    func didUpdatePopularArticles(withStatus status: Status)
}

class ArticlesViewModel {
    weak var delegate: ArticlesViewModelProtocol?
    
    fileprivate(set) var popularArticles: [Article] = []
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadPopularArticles(period: Int) {
        networkManager.fetchPopularArticles(period: period, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let popularArticlesResponse):
                if let popularArticles = popularArticlesResponse.results {
                    strongSelf.popularArticles = popularArticles
                    strongSelf.delegate?.didUpdatePopularArticles(withStatus: .success)
                }
            case .failure(let error):
                strongSelf.delegate?.didUpdatePopularArticles(withStatus: .failure(error: error.localizedDescription))
            }
        })
    }
    
    
}
