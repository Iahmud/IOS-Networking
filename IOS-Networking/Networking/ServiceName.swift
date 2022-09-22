//
//  ServiceName.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 20/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import Foundation


enum ServiceName {
    case get(ProductDetailsRequest)
    case post(AddPostRequest)
    case put(PutModel)
    case patch(PutModel)
    case delete(ProductDetailsRequest)
    
    func urlRequest() -> URLRequest {
        let baseURL = "https://dummyjson.com/"
        var stURL = ""
        var httpBody = Data()
        
        switch self {
        case .get(let product):
            stURL = baseURL + "products/\(product.productId)"
        case .post(let post):
            stURL = baseURL + "posts/add"
            httpBody = bodyBuilder(post)
        case .put(let post),
                .patch(let post):
            stURL = baseURL + "posts/\(post.id)"
            httpBody = bodyBuilder(post.putRequest)
            
        case .delete(let product):
            stURL = baseURL + "posts/\(product.productId)"
        }
        
        var request = requestBuilder(stURL)
        request.httpBody = httpBody
        return request
        
        
    }
    
    
    
    private func httpMethodRequest() -> HttpMethodRequest {
        switch self {
        case .get:
            return .GET
        case .post(_):
            return .POST
        case .put(_):
            return .PUT
        case .patch(_):
            return .PATCH
        case .delete(_):
            return .DELETE
        }
    }
    
    private func requestBuilder(_ url:String) -> URLRequest {
        let encodedUrl =  url.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: encodedUrl)
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = self.httpMethodRequest().rawValue
        return request
    }
    
    
    
    
    private func bodyBuilder<T: Encodable>(_ object:T) -> Data {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(object) {
            return data
        }
        return Data()
        
    }
    
    
    
}


