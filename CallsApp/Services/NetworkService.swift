//
//  NetworkService.swift
//  CallsApp
//
//  Created by Игорь Силаев on 08.11.2020.
//

import Foundation

final class NetworkService {

    // MARK: - Public
    
    func request(completion: @escaping (Data?, Error?) -> Void)  {
        guard let url = self.url() else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    // MARK: - Private

    private func url() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "5e3c202ef2cb300014391b5a.mockapi.io"
        components.path = "/testapi"
        return components.url
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data? , Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
