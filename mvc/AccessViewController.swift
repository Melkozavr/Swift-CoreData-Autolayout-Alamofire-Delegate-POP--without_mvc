//
//  AccessViewController.swift
//  mvc
//
//  Created by Melkozavr on 19.03.2020.
//  Copyright © 2020 Melkozavr. All rights reserved.
//

import UIKit

class AccessViewController: UIViewController, UICollectionViewDelegate, forViewControllers {

    var toPic: UIButton!
    var toMail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        toPic = UIButton(type: .system)
        toPic.setTitle("Go to Picture`s Page", for: .normal)
        toPic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toPic)
        //toPic.addTarget(self, action: #selector(handleToPicTouchUpInside), for: .touchUpInside)
        
        toMail = UIButton(type: .system)
        toMail.setTitle("Go to Mail", for: .normal)
        toMail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toMail)
        toMail.addTarget(self, action: #selector(handleToMailTouchUpInside), for: .touchUpInside)
        
        constraintsInit()
    }
    
    func constraintsInit() {
        NSLayoutConstraint.activate([
            toPic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toPic.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            toMail.bottomAnchor.constraint(equalTo: toPic.topAnchor, constant: -20),
            toMail.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 20),
            toMail.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor, constant: -20),
        ])
    }
    
    @objc func handleToMailTouchUpInside() {
        print("Mail button has been tapped")
        
        let mailViewController = MailViewController()
        self.navigationController?.pushViewController(mailViewController, animated: true)
    }
    
    @objc func handleToPicTouchUpInside() {
        print("Picture`s button has been tapped")
        
        let collectionViewController = CollectionViewController()
        self.navigationController?.pushViewController(collectionViewController, animated: true)
    }
}
