//
//  CollectionViewController.swift
//  mvc
//
//  Created by Melkozavr on 20.03.2020.
//  Copyright © 2020 Melkozavr. All rights reserved.
//

import UIKit

class AlamofireViewController: UIViewController, forViewControllers {
    
    var exitButton: UIButton!
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton = UIButton(type: .system)
        exitButton.setTitle("Exit", for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: exitButton), animated: true)
        exitButton.addTarget(self, action: #selector(handleExitButtonTouchUpInside), for: .touchUpInside)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        constraintsInit()
    }
    
    func constraintsInit() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant:  40).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    @objc func handleExitButtonTouchUpInside() {
        print("Exit button has been tapped")
        
        let viewController = ViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AlamofireViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .red
        
        return cell
    }
    
    
}

class CustomCell: UICollectionViewCell {
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
