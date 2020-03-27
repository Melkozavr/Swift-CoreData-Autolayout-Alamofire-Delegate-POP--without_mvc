//
//  MailViewController.swift
//  mvc
//
//  Created by Melkozavr on 20.03.2020.
//  Copyright © 2020 Melkozavr. All rights reserved.
//

import UIKit

class MailViewController: UIViewController, forViewControllers{

    var exitButton: UIButton!
    var toTextField: UITextField!
    var descriptionTextView: UITextView!
    var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        exitButton = UIButton(type: .system)
        exitButton.setTitle("Exit", for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: exitButton), animated: true)
        exitButton.addTarget(self, action: #selector(handleExitButtonTouchUpInside), for: .touchUpInside)
        
        toTextField = UITextField(frame: .zero)
        toTextField.layer.cornerRadius = 5
        toTextField.layer.borderWidth = 1
        toTextField.layer.borderColor = (UIColor.black.cgColor)
        toTextField.textAlignment = .left
        toTextField.placeholder = "To Whon It Will Concern?"
        toTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toTextField)
        
        descriptionTextView = UITextView(frame: .zero)
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = (UIColor.black.cgColor)
        descriptionTextView.textAlignment = .left
        descriptionTextView.text = ""
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.isEditable = true
        descriptionTextView.isScrollEnabled = true
        view.addSubview(descriptionTextView)
        
        sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        sendButton.addTarget(self, action: #selector(handleSendButtonTouchUpInside), for: .touchUpInside)
        
        constraintsInit()
    }
    
    func constraintsInit() {
        NSLayoutConstraint.activate([
            
            toTextField.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor, constant: 30),
            toTextField.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 20),
            toTextField.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor, constant: -20),

            descriptionTextView.heightAnchor.constraint(equalToConstant: 100.0),
            descriptionTextView.topAnchor.constraint(equalTo: toTextField.topAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor, constant: -20),

            sendButton.topAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: 120),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func handleSendButtonTouchUpInside() {
        print("Send button has been tapped")
        if toTextField.text! != "" && descriptionTextView.text! != "" {
            let alert = UIAlertController(title: "Report", message: "Message has been sent", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("who will get the message: \(toTextField.text!), text of the message: \(descriptionTextView.text!)")
            toTextField.text = ""
            descriptionTextView.text = ""
        } else {
            let alert = UIAlertController(title: "Error", message: "Please, fill all the fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func handleExitButtonTouchUpInside() {
        print("Exit button has been tapped")
        let viewController = ViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

