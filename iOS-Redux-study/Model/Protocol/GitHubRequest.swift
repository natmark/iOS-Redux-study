//
//  GitHubRequest.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import APIKit

class DecodableDataParser: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}
protocol GitHubRequest: Request {

}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var dataParser: DataParser {
        return DecodableDataParser()
    }

    var decoder: JSONDecoder {
        return JSONDecoder()
    }
}

extension GitHubRequest {
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        return urlRequest
    }
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
        return object
    }
}

extension GitHubRequest where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try decoder.decode(Response.self, from: data)
    }
}
