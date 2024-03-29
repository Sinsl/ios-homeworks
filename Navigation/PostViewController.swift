//
//  PostViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Title Post"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
        
        let info = UIBarButtonItem(image: UIImage(named: "info"), style: .plain, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = info
    }
    
    @objc func openInfo() {
        
        let infoViewController = InfoViewController()
        let infoNavContr = UINavigationController (rootViewController: infoViewController)
        present(infoNavContr, animated: true, completion: nil)
    }
    
}
