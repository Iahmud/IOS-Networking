//
//  NetworkingManager.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 20/09/2022.
//  Email: Advansys.iahmed@gmail.com
//
import Foundation


class NetworkingManager : NSObject {
    static func fetchdata<T:Decodable>(_ serviceName:ServiceName,
                          completion: @escaping (Result<T?,NetworkingError>) -> ())
    {
        
        guard InternetConnection.isInternetAvailable()
        else{completion(.failure(.internetConnection))
            return }
        
        let task = URLSession.shared.dataTask(with: serviceName.urlRequest()) { data, response, error in
          guard let data = data else { completion(.failure(.invalidresponse))
              return}
          do {
              let DicData = try JSONDecoder().decode(T.self, from: data)
              completion(.success(DicData))
              return
          }catch{
              completion(.failure(.invalidJsonData))
              return
          }
            
        }

        task.resume()
    }

    
}

