//
//  APIService.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import Foundation

protocol APIServiceProtocol {
    func getPlot(completion: @escaping (Result<Plot, Error>) -> Void)
}

struct APIService: APIServiceProtocol {
    init() { }
    
    func getPlot(completion: @escaping (Result<Plot, Error>) -> Void) {
        let route = APIRoute.characters
        request(to: route.url) { result in
            completion(result)
        }
    }
}

private extension APIService {
    func request(to route: URL, completion: @escaping (Result<Plot, Error>) -> Void) {
        URLSession.shared.dataTask(with: route) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            do {
                let data = try JSONDecoder().decode(Plot.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch  {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
