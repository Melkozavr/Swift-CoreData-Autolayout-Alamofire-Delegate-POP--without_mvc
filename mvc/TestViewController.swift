//
//  TestViewController.swift
//  mvc
//
//  Created by Melkozavr on 27.03.2020.
//  Copyright © 2020 Melkozavr. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class TestViewController: UIViewController {
    
    let parameters = ["category": "Movies", "genre": "Action"]
    let headers: HTTPHeaders = [
        .authorization(username: "test@email.com", password: "testpassword"),
        .accept("application/json")
    ]
    let user = "test@email.com"
    let password = "testpassword"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://httpbin.org/get").response {
            response in debugPrint(response)
        }
        //Post
        AF.request("https://httpbin.org/post", method: .post).response {
            response in debugPrint(response)
        }
        //Put
        AF.request("https://httpbin.org/put", method: .put).response {
            response in debugPrint(response)
        }
        //Delete
        AF.request("https://httpbin.org/delete", method: .delete).response {
            response in debugPrint(response)
        }
        
        AF.request("https://httpbin.org/get", parameters: parameters).response {
            response in debugPrint(response)
        }
        AF.request("https://httpbin.org/headers", headers: headers).responseJSON {
            response in debugPrint(response)
        }
        AF.request("https://httpbin.org/headers", parameters: parameters, headers: headers).responseJSON { response in debugPrint(response)
        }
        
        // Normal way to authenticate using the .authenticate with username and password
        AF.request("https://httpbin.org/basic-auth/\(user)/\(password)").authenticate(username: user, password: password).responseJSON {
            response in debugPrint(response)
        }
        // Authentication using URLCredential
        let credential = URLCredential(user: user, password: password, persistence: .forSession)
        AF.request("https://httpbin.org/basic-auth/\(user)/\(password)").authenticate(with: credential).responseJSON {
            response in debugPrint(response)
        }
        
    }
    
}
