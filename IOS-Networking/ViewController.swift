//
//  ViewController.swift
//  IOS-Networking
//
//  Created by Islam Ahmed on 19/09/2022.
//  Email: Advansys.iahmed@gmail.com
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labResult: UILabel!

    @IBOutlet weak var labError: UILabel!
    
    var homeVM : HomeVM? = HomeVM()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsLayout()
    }

    @IBAction func btnGet(_ sender: Any) {
        clearLabels()
        labResult.text = "Loading ..."
        homeVM?.getMethod()
    }
    
    @IBAction func btnPost(_ sender: Any) {
        clearLabels()
        labResult.text = "Loading ..."
        homeVM?.postMethod()
    }
    
    @IBAction func btnPut(_ sender: Any) {
        clearLabels()
        labResult.text = "Loading ..."
        homeVM?.putMethod()
    }
    
    
    @IBAction func btnPatch(_ sender: Any) {
        clearLabels()
        labResult.text = "Loading ..."
        homeVM?.patchMethod()
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        clearLabels()
        labResult.text = "Loading ..."
        homeVM?.deleteMethod()
    }
    
    
    func clearLabels() {
        labResult.text = ""
        labError.text = ""
    }
}



extension ViewController {
    func setupViewsLayout() {
        setupBindedView()
    }
  
    func setupBindedView()
    {
       
        homeVM?.didRecevedProduct = { [weak self] product in
            guard let self = self else {return}
            DispatchQueue.main.async(){
                self.labResult.text = "Product Title : \(product?.title ?? "") \n Product description : \(product?.description ?? "")"
            }
        }
        
        homeVM?.didAddPost = { [weak self] post in
            guard let self = self else {return}
            DispatchQueue.main.async(){
                self.labResult.text = "Post Id : \(post?.id ?? 0) \n Post title : \(post?.title ?? "")"
            }
        }
        
        
        homeVM?.didRecievePut = { [weak self] post in
            guard let self = self else {return}
            DispatchQueue.main.async(){
                self.labResult.text = "Post title : \(post?.title ?? "") \n Post body : \(post?.body ?? "")"
            }
        }
        
        homeVM?.didShowError = { [weak self] error in
            guard let self = self else {return}
            DispatchQueue.main.async(){
                self.labError.text = "error : \(error)"
            }
        }
        
        
        
    }
 
}


