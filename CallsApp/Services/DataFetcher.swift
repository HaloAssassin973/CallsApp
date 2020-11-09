//
//  DataFetcher.swift
//  CallsApp
//
//  Created by Игорь Силаев on 08.11.2020.
//

import Foundation

final class DataFetcher {

    // MARK: - Properties

    var networkService = NetworkService()

    // MARK: - Public

    func fetchData(completion: @escaping (Call?) -> ()) {
        networkService.request() { [weak self] (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }

            let decode = self?.decodeJSON(type: Call.self, from: data)
            completion(decode)
        }
    }

    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }

        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
