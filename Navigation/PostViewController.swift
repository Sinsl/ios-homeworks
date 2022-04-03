//
//  PostViewController.swift
//  Navigation
//
//  Created by Mac Home on 03.04.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
        
        let info = UIBarButtonItem(image: #imageLiteral(resourceName: "info"), style: .plain, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = info
    }
    
    @objc func openInfo() {
        
        let infoViewController = InfoViewController()
        let infoNavContr = UINavigationController (rootViewController: infoViewController)
        present(infoNavContr, animated: true, completion: nil)

        
    }
    

}
