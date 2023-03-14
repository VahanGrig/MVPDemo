//
//  NetworkManageable.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

protocol NetworkManageable {
    associatedtype Service: IServiceable
    var service: Service { get }
}

extension NetworkManageable {
    func execute() async throws -> Service.Response {
        do {
            let response = try await service.execute()
            return response
        }
        catch {
            // handle general error cases
            throw error
        }
    }
    
    func execute(_ completion: @escaping (Result<Service.Response, Error>) -> Void) {
        Task {
            do {
                let response = try await execute()
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}
