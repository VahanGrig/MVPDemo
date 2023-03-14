//
//  Resource.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

protocol IResponse: Decodable {
    static var decoder: JSONDecoder { get }
}
protocol IBody: Encodable {
    static var encoder: JSONEncoder { get }
}

extension IResponse {
    static var decoder: JSONDecoder { JSONDecoder() }
}

extension IBody {
    static var encoder: JSONEncoder { JSONEncoder() }
}

protocol IResource {
    associatedtype Response: IResponse
    associatedtype Body: IBody

    var body: Body? { get }
    var bodyData: Data? { get }
    var url: URL { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var additionalHeaders: [String: String]? { get }
    var headers: [String: String] { get }
    var method: ResourceMethod { get }
    var contentType: String { get }
}

extension IResource {
    var url: URL { return URL(string: "https://nekos.best/api/v2/" + path)! }
    
    var path: String { return "" }
    
    var parameters: [String: Any]? { return nil }
    
    var method: ResourceMethod { return .get }
    
    var contentType: String { return "application/json" }
    
    var bodyData: Data? {
        guard let body else { return nil }
        return try? Body.encoder.encode(body)
    }
    
    var additionalHeaders: [String: String]? { nil }
    var headers: [String: String] {
        var headers = [String: String]()
        if let additionalHeaders {
            headers.merge(additionalHeaders) { current, _ in current }
        }
        return headers
    }

}

public enum ResourceMethod: String {
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case put = "PUT"
    case delete = "DELETE"
}
