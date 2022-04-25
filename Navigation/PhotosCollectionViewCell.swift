//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Mac Home on 25.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .red
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupCell(namePhoto: String){
        imageView.image = UIImage(named: namePhoto)
    }
    
}
