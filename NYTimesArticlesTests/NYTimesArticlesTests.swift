//
//  NYTimesArticlesTests.swift
//  NYTimesArticlesTests
//
//  Created by Nada Kamel on 11/02/2021.
//

import XCTest

@testable import NYTimes_Articles

class NYTimesArticlesTests: XCTestCase {

    var network: NetworkManager!
    var viewModel: ArticlesViewModel!
    
    override func setUp() {
        super.setUp()
        network = NetworkManager()
        viewModel = ArticlesViewModel(networkManager: network)
    }

    override func tearDown() {
        network = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testViewModelInitialisation() {
        XCTAssertNotNil(viewModel, "The articles view model should not be nil.")
        XCTAssertTrue(viewModel.networkManager === network, "The networkManager should be equal to the network that was passed in.")
    }
    
    func testSuccessfulMostPopularArticlesAPIRequest() {
        network.fetchPopularArticles(period: 1, completion: { result in
            switch result {
            case .success(let popularArticlesResponse):
                if let articles = popularArticlesResponse.results, articles.count > 0 {
                    let article: Article = articles[0]
                    XCTAssertEqual(article.source?.rawValue, "New York Times")
                }
            case .failure:
                XCTFail()
                return
            }
        })
    }
    

}
