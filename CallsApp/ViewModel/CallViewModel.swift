//
//  CallViewModel.swift
//  CallsApp
//
//  Created by Игорь Силаев on 09.11.2020.
//

import Foundation

final class CallViewModel {

    // MARK: - Properties

    private let dataFetcher = DataFetcher()
    var callModel: Call?

    // MARK: - Initialization

    init(model: Call? = nil) {
        self.callModel = model
    }

    // MARK: - Public

    func fetchCall(completion: @escaping (Call?) -> ()) {
        dataFetcher.fetchData { data in
            completion(data)
        }
    }
}
