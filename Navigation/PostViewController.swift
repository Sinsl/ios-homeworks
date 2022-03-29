//
//  PostViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
    }
    
}
