//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView(frame: .zero)
    
    private lazy var newButton: UIButton = {

            let button = UIButton()
                button.backgroundColor = .systemBlue
                button.setTitle("Новая кнопка", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//                button.addTarget(self, action: #selector( ), for: .touchUpInside)
                button.translatesAutoresizingMaskIntoConstraints = false

            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray4
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(newButton)
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
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    

}
