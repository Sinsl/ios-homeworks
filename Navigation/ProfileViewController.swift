//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView(frame: .zero)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray4
        self.view.addSubview(profileHeaderView)
        setLayout()
        
    }
    
    func setLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
           profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
           profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
           profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    

}
