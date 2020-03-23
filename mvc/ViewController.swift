//
//  ViewController.swift
//  mvc
//
//  Created by Melkozavr on 19.03.2020.
//  Copyright © 2020 Melkozavr. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Views, Controllers and Buttons

    var nameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.hidesBackButton = true
        
        nameTextField = UITextField(frame: .zero)
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = (UIColor.black.cgColor)
        nameTextField.textAlignment = .center
        nameTextField.placeholder = "Enter Username"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = (UIColor.black.cgColor)
        passwordTextField.textAlignment = .center
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(handleLoginTouchUpInside), for: .touchUpInside)
        
        constraintsInit()
    }
    
// MARK: - Constraints
    
    func constraintsInit() {
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor, constant: -20),
            
            nameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            nameTextField.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor, constant: -20)
        ])
    }
    
// MARK: - Push button and segue
    
    
    @objc func handleLoginTouchUpInside() {
        print("Login button has been tapped")
        
        let accessViewController = AccessViewController()
        self.navigationController?.pushViewController(accessViewController, animated: true) // works with navigation controller
        //self.present(accessViewController, animated: true, completion: nil) if you have not navigation controller
    }
}
