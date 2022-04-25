//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Mac Home on 25.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let titlePhotos: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var arrowRight: UIImageView = {
        let view = UIImageView(image: UIImage(named: "arrow_right"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fillEqually
        return view
    }()
    private lazy var photoViewOne: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var photoViewTwo: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var photoViewThree: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var photoViewFour: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    
    private let anyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        addPhotosView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        contentView.addSubview(titlePhotos)
        contentView.addSubview(arrowRight)
        contentView.addSubview(stackView)
        
        let margin: CGFloat = 12
        let heightPhotos = (UIScreen.main.bounds.width - margin * 2 - 8 * 3)/4
        
        NSLayoutConstraint.activate([
            titlePhotos.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            titlePhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin)
        ])
        
        NSLayoutConstraint.activate([
            arrowRight.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            arrowRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            arrowRight.widthAnchor.constraint(equalToConstant: 24),
            arrowRight.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: margin),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            stackView.heightAnchor.constraint(equalToConstant: heightPhotos),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin)
        ])

    }
    private func addPhotosView(){
        let photosViewArray = [photoViewOne, photoViewTwo, photoViewThree, photoViewFour]
        for (index, item) in photosViewArray.enumerated() {
            item.image = UIImage(named: "car\(index + 1)")
            item.layer.cornerRadius = 6
            item.layer.masksToBounds = true
            stackView.addArrangedSubview(item)
        }
  
    }
}
