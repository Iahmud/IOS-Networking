//
//  NetworkingError.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 20/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import Foundation

enum NetworkingError : Error {
    case internetConnection
    case invalidURL
    case invalidJsonData
    case invalidresponse
    
    func description() -> String
    {
        switch self {
        case .internetConnection:
            return "internetConnection error"
        case .invalidURL:
            return "invalidURL error"
        case .invalidJsonData:
            return "invalidJsonData error"
        case .invalidresponse:
            return "invalidresponse error"
        }
    }
}
