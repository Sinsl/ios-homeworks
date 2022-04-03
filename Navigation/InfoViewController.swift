//
//  InfoViewController.swift
//  Navigation
//
//  Created by Mac Home on 03.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        self.navigationItem.title = "Информация"
        setupButton()
        
    }
    
    private lazy var button: UIButton = {

            let button = UIButton()
        button.backgroundColor = .lightGray
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
        button.layer.borderColor = .init(gray: 0.8, alpha: 1)
        button.setTitle("Закрыть Инфо", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false

            return button

        }()
    @objc private func buttonAction() {

        let alert = UIAlertController(title: "Зкрыть Инфо?", message: "Вы хотите закрыть блок информации?", preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in print("Отмена")})
        alert.addAction(cancelAlert)
        let closeAlert = UIAlertAction(title: "Закрыть", style: .destructive, handler:  { _ in print("Закрыть инфо")
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(closeAlert)
        present(alert, animated: true, completion: nil)

        }
    
    
    
    private func setupButton() {

        self.view.addSubview(self.button)
        
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true

        }
}
