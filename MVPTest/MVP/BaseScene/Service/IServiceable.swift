//
//  IServiceable.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit


protocol Serviceable {}

enum APIError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case invalidData
}

protocol IServiceable: Serviceable  {
    associatedtype Resource: IResource
    
    var resource: Resource { get }
}

extension IServiceable {
    typealias Response = Resource.Response

    func execute() async throws -> Resource.Response {
        let session = URLSession.shared
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.method.rawValue
        request.httpBody = resource.bodyData
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.requestFailed(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 500)
        }
        
        if resource.method != .get {
            guard let encodedData = data as? Response else { throw APIError.invalidData }
            return encodedData
        } else {
            do {
                let decodedData = try Response.decoder.decode(Response.self, from: data)
                return decodedData
            } catch {
                throw APIError.invalidData
            }
        }
    }
}
