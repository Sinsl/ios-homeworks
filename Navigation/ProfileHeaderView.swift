//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mac Home on 06.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    lazy var avatarImageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Jorik"))
            image.translatesAutoresizingMaskIntoConstraints = false
            image.layer.cornerRadius = 50
            image.layer.borderWidth = 3
            image.layer.borderColor = UIColor.white.cgColor
            image.layer.masksToBounds = true
        return image
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label  = UILabel()
            label.text = "Мурчало"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var setStatusButton: UIButton = {
        let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Установить новый статус", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 14
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.7
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
    }()
    
    lazy var statusLabel: UILabel = {
        let label  = UILabel()
            label.text = "Статус не установлен..."
            label.font = label.font.withSize(14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statusText: String = ""
    private var flagStatusButton: Bool = false
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Впишите новый статус"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.addTarget(self, action: #selector(statusTextChanged), for: UIControl.Event.editingChanged)

        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()

      }

      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      }

    func addElements (){
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        statusTextField.isHidden = true
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "Статус не установлен..."
    }

    
    @objc func buttonPressed(){
//        print(statusLabel.text!)
        if flagStatusButton == false {
            statusTextField.isHidden = false
            statusLabel.isHidden = true
            flagStatusButton = true
            setStatusButton.setTitle("Сохранить новый статус", for: .normal)
            return
        } else {
            if statusText == "" {
                statusLabel.text = "Статус не установлен..."
            } else {
                statusLabel.text = statusText
            }
            statusLabel.isHidden = false
            statusTextField.isHidden = true
            flagStatusButton = false
            statusTextField.text = ""
            setStatusButton.setTitle("Установить новый статус", for: .normal)
            print(statusLabel.text!)
            statusTextField.resignFirstResponder()
            return
        }
    }
        


    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: super.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: super.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            statusTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.rightAnchor.constraint(equalTo: superview!.rightAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34)
        ])

        super.updateConstraints()
    }

}
