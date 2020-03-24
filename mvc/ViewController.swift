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
    
// MARK: - Save CoreData
    
    func addUsers(_ name: String, _ password: String, _ rights: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(name, forKey: "name")
        newUser.setValue(password, forKey: "password")
        newUser.setValue(rights, forKey: "rights")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    // MARK: - Views, Controllers, Buttons and add some data in CoreData

    var nameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.hidesBackButton = true
        
        addUsers("Alex", "123", "admin")
        addUsers("Martin", "qwe", "apprentice")
        addUsers("Melman", "asd", "hr")
        addUsers("Gloria", "zxc", "smm")
        
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
    
// MARK: - Push button, fetching data and segue
    
    
    @objc func handleLoginTouchUpInside() {
        print("Login button has been tapped")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var counter = 0

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if data.value(forKey: "name") as! String == nameTextField.text! {
                    counter += 1
                }
                
            }
            for data in result as! [NSManagedObject] {
                if data.value(forKey: "password") as! String == passwordTextField.text! {
                    counter += 1
                }
            }
            
        } catch {
            
            print("Failed")
        }
        if nameTextField.text != "" && passwordTextField.text != ""{
            if counter == 2 {
                let accessViewController = AccessViewController()
                self.navigationController?.pushViewController(accessViewController, animated: true) // works with navigation controller
                //self.present(accessViewController, animated: true, completion: nil) if you have not navigation controller
            } else {
                let alert = UIAlertController(title: "Error!", message: "Password or Login are incorrect", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Error!", message: "Fill the TextFields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
