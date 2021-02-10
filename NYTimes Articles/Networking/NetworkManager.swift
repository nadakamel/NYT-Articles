//
//  NetworkManager.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import Moya

protocol Networkable {
    var apiProvider: MoyaProvider<APIEndpoints> { get }
    
    func fetchPopularArticles(period: Int, completion: @escaping (Result<MostPopularArticles, Error>) -> ())
}

class NetworkManager: Networkable {

    static let endpointClosure = { (endpoint: APIEndpoints) -> Endpoint in
        return Endpoint(url: endpoint.path,
                        sampleResponseClosure: {.networkResponse(200, endpoint.sampleData)},
                        method: endpoint.method,
                        task: endpoint.task,
                        httpHeaderFields: endpoint.headers)
    }
    
    let apiProvider = MoyaProvider<APIEndpoints>(endpointClosure: endpointClosure)

    func fetchPopularArticles(period: Int, completion: @escaping (Result<MostPopularArticles, Error>) -> ()) {
        request(target: .mostPopular(period: period), completion: completion)
    }
}

private extension NetworkManager {

    private func request<T: Decodable>(target: APIEndpoints, completion: @escaping (Result<T, Error>) -> ()) {
        apiProvider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
