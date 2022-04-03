//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mac Home on 03.04.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private lazy var avatarImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Jorik"))
            image.layer.cornerRadius = 50
            image.layer.borderWidth = 3
            image.layer.borderColor = UIColor.white.cgColor
            image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var titleName: UILabel = {
        let label  = UILabel()
            label.text = "Мурчало"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .black
        return label
    }()

    private lazy var buttonShowStatus: UIButton = {
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
            
        return button
    }()
    
    private lazy var statusLabel: UILabel = {
        let label  = UILabel()
            label.text = "Статус не установлен..."
            label.font = label.font.withSize(14)
            label.textColor = .gray
        return label
    }()
    
    private var statusText: String = ""
    private var flagStatusButton: Bool = false
    
    lazy var addStatusText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Впишите новый статус"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
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
        
        addSubview(avatarImage)
        addSubview(titleName)
        addSubview(buttonShowStatus)
        addSubview(statusLabel)
        addSubview(addStatusText)
        addStatusText.isHidden = true
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        let viewWidth = self.frame.size.width
        avatarImage.frame = CGRect(x: 16, y: 88 + 16, width: 100, height: 100)
        titleName.frame = CGRect(x: 132, y: 88 + 27, width: 300, height: 30)
        buttonShowStatus.frame = CGRect(x: 16, y: 88 + 132, width: viewWidth - 32, height: 50)
        statusLabel.frame = CGRect(x: 132, y: 88 + 132 - 54, width: 300, height: 20)
        addStatusText.frame = CGRect(x: 132, y: 88 + 132 - 64, width: viewWidth - 148, height: 50)
        
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "Статус не установлен..."
    }
    
    @objc func buttonPressed(){
//        print(statusLabel.text!)
        if flagStatusButton == false {
            addStatusText.isHidden = false
            statusLabel.isHidden = true
            flagStatusButton = true
            buttonShowStatus.setTitle("Сохранить новый статус", for: .normal)
            print(statusLabel.text!)
            return
        } else {
            if statusText == "" {
                statusLabel.text = "Статус не установлен..."
            } else {
                statusLabel.text = statusText
            }
            statusLabel.isHidden = false
            addStatusText.isHidden = true
            flagStatusButton = false
            addStatusText.text = ""
            buttonShowStatus.setTitle("Установить новый статус", for: .normal)
            print(statusLabel.text!)
            return
        }
    }

}

