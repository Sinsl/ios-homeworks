//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Mac Home on 16.04.2022.
//

import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {

    private let titlePost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let imagePost: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .justified
        return label
    }()
    
    private let likesPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let viewsPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private let indentSize: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customizeCell()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {

        [titlePost, imagePost, descriptionPost, likesPost, viewsPost].forEach{ contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            titlePost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: indentSize),
            titlePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indentSize),
            titlePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indentSize)
        ])
        NSLayoutConstraint.activate([
            imagePost.topAnchor.constraint(equalTo: titlePost.bottomAnchor, constant: indentSize),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: screenWidth)
        ])
        NSLayoutConstraint.activate([
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: indentSize),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indentSize),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indentSize)
        ])
        NSLayoutConstraint.activate([
            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: indentSize),
            likesPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: indentSize),
            likesPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -indentSize)
        ])
        
        NSLayoutConstraint.activate([
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: indentSize),
            viewsPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -indentSize),
            viewsPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -indentSize)
        ])
    }
    func setupCell(post: Post){
        titlePost.text = post.title
        imagePost.image = UIImage(named: post.image)
        descriptionPost.text = post.description
        likesPost.text = "Likes: \(post.likes)"
        viewsPost.text = "Views: \(post.views)"
    }
    private func customizeCell() {
        self.contentView.backgroundColor = .white
    }
}
