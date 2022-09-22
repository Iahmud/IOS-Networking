//
//  AddPostModel.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 21/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import Foundation

struct AddPostRequest:Codable
{
    var title : String
    var userId : Int
}


struct AddPostResponse:Codable
{
    var id: Int?
    var title: String?
    var userId: Int?
}
