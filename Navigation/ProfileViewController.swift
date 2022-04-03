//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac Home on 03.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray3
        self.view.addSubview(profileHeaderView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
       
    }
    
}
