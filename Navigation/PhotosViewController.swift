//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Mac Home on 25.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
}
