//
//  FeedViewController.swift
//  Navigation
//
//  Created by Mac Home on 03.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        setupButton()
        
    }
    
    private lazy var button: UIButton = {

            let button = UIButton()
        button.backgroundColor = .init(red: 11/255, green: 215/255, blue: 55/255, alpha: 1)
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 2
        button.layer.borderColor = .init(red: 12/255, green: 115/255, blue: 34/255, alpha: 1)
        button.setTitle("Выбранный пост", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false

            return button

        }()
    
    
    @objc private func buttonAction() {

            let postViewController = PostViewController()

            self.navigationController?.pushViewController(postViewController, animated: true)
            postViewController.titlePost = post.title

        }
    
    
    
    private func setupButton() {

        self.view.addSubview(self.button)
        
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        }
    
}
