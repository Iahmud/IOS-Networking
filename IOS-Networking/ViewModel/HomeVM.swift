//
//  HomeVM.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 21/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import Foundation


class HomeVM: NSObject {
    
    var didShowError: ((String) -> Void)?
    
    var didRecevedProduct: ((ProductDetailsResponse?) -> Void)?
    private var productDetailsResponse : ProductDetailsResponse?
    
    var didAddPost: ((AddPostResponse?) -> Void)?
    private var addPostResponse : AddPostResponse?
    
    var didRecievePut: ((PutResponse?) -> Void)?
   private var putResponse : PutResponse?
    
}

extension HomeVM {
    func getMethod()
    {
        let reqpage = ProductDetailsRequest(productId: 1)
        NetworkingManager.fetchdata(.get(reqpage)) { [weak self]
            (_ result: Result<ProductDetailsResponse?,NetworkingError>) in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.productDetailsResponse = data
                self.didRecevedProduct?(self.productDetailsResponse)
            case .failure(let error):
                self.didShowError?(error.description())
            }
        }
    }
    
    
    func postMethod()
    {
        let post = AddPostRequest(title: "I am in love with someone.", userId: 5)
        NetworkingManager.fetchdata(.post(post)) { [weak self]
            (_ result: Result<AddPostResponse?,NetworkingError>) in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.addPostResponse = data
                self.didAddPost?(self.addPostResponse)
            case .failure(let error):
                self.didShowError?(error.description())
            }
        }
    }

    func putMethod()
    {
        let post = PutModel(id: 1, putRequest: PutRequest(title: "I think I should shift to the moon"))
        
        NetworkingManager.fetchdata(.put(post)) { [weak self]
            (_ result: Result<PutResponse?,NetworkingError>) in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.putResponse = data
                self.didRecievePut?(self.putResponse)
            case .failure(let error):
                self.didShowError?(error.description())
            }
        }
    }
    
    func patchMethod()
    {
        let post = PutModel(id: 1, putRequest: PutRequest(title: "I think I should shift to the moon"))
        
        NetworkingManager.fetchdata(.patch(post)) { [weak self]
            (_ result: Result<PutResponse?,NetworkingError>) in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.putResponse = data
                self.didRecievePut?(self.putResponse)
            case .failure(let error):
                self.didShowError?(error.description())
            }
        }
    }
    
    func deleteMethod()
    {
        let reqpage = ProductDetailsRequest(productId: 1)
        NetworkingManager.fetchdata(.delete(reqpage)) { [weak self]
            (_ result: Result<PutResponse?,NetworkingError>) in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.putResponse = data
                self.didRecievePut?(self.putResponse)
            case .failure(let error):
                self.didShowError?(error.description())
            }
        }
    }
    

    
}
