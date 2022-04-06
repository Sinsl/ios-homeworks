//
//  FeedViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост")
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
//        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    private lazy var buttonOne: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Кнопка один", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonTwo: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitle("Кнопка два", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        self.view.addSubview(stackView)
        setLoyaout()
        setButtons()
        
    }
    
    private func setLoyaout(){
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 300),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    private func setButtons() {
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
    }
    
    @objc private func buttonPressed() {
        let postViewController = PostViewController()

        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
}
