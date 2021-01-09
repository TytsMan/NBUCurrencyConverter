//
//  NetworkRouter.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

public typealias NetworkRouterComletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterComletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterComletion) {
        
        print(#function)
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                print(#function)
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        do {
            
            let task = route.task
            
            self.addAdditionalHeaders(task.additionalHeaders,
                                      request: &request)
        
            try self.configureParameters(bodyParameters: task.bodyParameters,
                                         urlParameters: task.urlParameters,
                                         request: &request)

            return request
        } catch  {
            throw error
        }
        
    }
    
    private func configureParameters(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request,
                                                with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request,
                                               with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?,
                                      request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
