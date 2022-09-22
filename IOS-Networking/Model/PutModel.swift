//
//  PutModel.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 22/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import Foundation


struct PutModel:Codable
{
    var id : Int
    var putRequest : PutRequest
}

struct PutRequest:Codable
{
    var title : String
}


struct PutResponse:Codable
{
    var title: String?
    var body: String?
    var userId: Int?
}


