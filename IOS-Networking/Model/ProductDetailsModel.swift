//
//  ProductDetails.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 21/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import Foundation


struct ProductDetailsRequest:Codable
{
    var productId = 1
}


struct ProductDetailsResponse:Codable
{
    var id: Int?
    var title, description: String?
    var price: Int?
    var discountPercentage, rating: Double?
    var stock: Int?
    var brand, category: String?
    var thumbnail: String?
    var images: [String]?

}
