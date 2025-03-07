//
//  Endpoint.swift
//  InstaStories
//
//  Created by Anis BOUZIANE on 07/03/2025.
//

import Foundation

enum Endpoint {
    case users

    private var fullPath: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "picsum.photos"

        switch self {
        case .users:
            components.path = "/v2/list"

            return components
        }
    }

    private enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }

    private var method: HTTPMethod {
        switch self {
        case .users:
            return .get
        }
    }

    var request: URLRequest {
        guard let url = fullPath.url else {
            fatalError(fullPath.path)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
