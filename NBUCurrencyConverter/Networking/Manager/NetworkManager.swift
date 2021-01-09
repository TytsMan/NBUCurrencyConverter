//
//  NetworkManager.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    private let router = Router<NBUAPI>()
    
    func getCurrentCourses(completion: @escaping (_ data: CurrencyArrayWrapperTDO?,_ error: Error?)->()) -> Void  {
        
        print(#function)
        router.request(.nowadaysCourses) { (data, response, error) in
            
            print(#function)
            
            if error != nil {
                completion(nil, NetworkResponse.noInternet)
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData)
                        return
                    }
                    
                    do {
                        
                        let apiResponse = try JSONDecoder().decode(CurrencyArrayWrapperTDO.self, from: responseData)
                        
                        completion(apiResponse, nil)
                        
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode)
                    }
                    
                    
                case .failure(let error):
                    completion(nil, error)
                }
                
            }
            
        }
        
    }
    
}

enum Result<String> {
    case success
    case failure(String)
}

enum NetworkResponse: String, Error {
    case success
    case autheficationError = "You need to be autheficated first."
    case badRequest = "Bad request."
    case outdated = "The url requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case noInternet = "Have no internet connection."
}

private extension NetworkManager {
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Error> {
        switch response.statusCode {
        case 200...299: return .success
        case 400...499: return .failure(NetworkResponse.autheficationError)
        case 500...599: return .failure(NetworkResponse.badRequest)
        case 600: return .failure(NetworkResponse.outdated)
        default: return .failure(NetworkResponse.failed)
        }
    }
}
