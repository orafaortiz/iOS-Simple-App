//
//  APILoader.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 17/02/22.
//

import Foundation

struct APILoader {
    
    func getData(url: URL, completion: @escaping(Result<AnyObject?, ServiceError>) -> Void)
    {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue(APIHeaders.contentTypeValue, forHTTPHeaderField: APIHeaders.kContentType)
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                
                guard error == nil else {
                    completion(.failure(ServiceError(httpStatus: httpResponse.statusCode,
                                                     message: "Service Error: \(error?.localizedDescription ?? "Unknown Error")")))
                    return
                }
                
                guard let responseData = data else {
                    completion(.failure(ServiceError(httpStatus: httpResponse.statusCode,
                                                     message: "ServiceError : \(error?.localizedDescription ?? "Unknown Error")")))
                    return
                }
                
                completion(.success(responseData as AnyObject))
            }
        }.resume()
    }
}
