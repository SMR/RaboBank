//
//  DataProvider.swift
//  Rabo
//
//  Created by iSparshIT on 28/04/22.
//

import Foundation

enum DataProviderError: Error {
    case resourceNotFound
    case parsingFailure(inner: Error)
}

protocol DataProvider {
    typealias FetchCustomerResult = Result<[Customer], Error>
    typealias FetchCustomerCompletion = (FetchCustomerResult) -> Void

    func fetchCustomerList(_ completion: @escaping FetchCustomerCompletion)
}

struct LocalCustomerDataProvider: DataProvider {

    private let queue = DispatchQueue(label: "LocalCustomerDataProviderQueue")

    // Completion block will be called on main queue
    func fetchCustomerList(_ completion: @escaping FetchCustomerCompletion) {
        guard let path = Bundle.main.url(forResource: "issues", withExtension: "csv") else {
            DispatchQueue.main.async {
                completion(.failure(DataProviderError.resourceNotFound))
            }
            return
        }

        queue.async {
            do {
                let dataStr = try String(contentsOf: path, encoding: .utf8)
                let collection = try CSVDecoder().decode([Customer].self, from: dataStr)

                let results = collection
                    .sorted(by: { $0.issueCount < $1.issueCount })

                DispatchQueue.main.async {
                    completion(.success(results))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(DataProviderError.parsingFailure(inner: error)))
                }
            }
        }
    }
}

