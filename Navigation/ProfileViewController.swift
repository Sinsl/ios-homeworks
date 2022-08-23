//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let posts = Post.makePosts()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        return tableView
    }()
    
    private let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setAnimation()
        backgroundСolor()
    }
    
    private func backgroundСolor() {
        #if DEBUG
        self.view.backgroundColor = .systemGray3
        #else
        self.view.backgroundColor = .systemGray6
        #endif
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setAnimation() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        headerView.avatarImageView.addGestureRecognizer(tapGesture)
        headerView.avatarImageView.isUserInteractionEnabled = true
        headerView.buttonStop.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
    }
    
    @objc func tapAction() {
        
        let width: CGFloat  = (tableView.frame.width)/headerView.avatarImageView.frame.width
        let translatedX: CGFloat = self.view.frame.width/2
        let translatedY: CGFloat = tableView.frame.height/2
        
        headerView.shutterView.frame.size = CGSize(width: self.view.frame.width, height: tableView.frame.height)
        tableView.isScrollEnabled = false
        headerView.shutterView.layer.zPosition = 1
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.headerView.shutterView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        }, completion: { (true) in
            self.headerView.buttonStop.isHidden = false
        })

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.headerView.avatarImageView.center = CGPoint(x: translatedX, y: translatedY)
            self.headerView.avatarImageView.transform = self.headerView.avatarImageView.transform.scaledBy(x: width, y: width)
            self.headerView.avatarImageView.layer.cornerRadius = 0
            self.headerView.avatarImageView.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveLinear, animations: {
            self.headerView.buttonStop.alpha = 1
        })
    }
    @objc func pressButton() {
        
        let width: CGFloat  = 100/headerView.avatarImageView.frame.width

        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
            self.headerView.buttonStop.alpha = 0.0
        })
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveLinear, animations: {
            self.headerView.avatarImageView.center = CGPoint(x: 66, y: 66)
            self.headerView.avatarImageView.transform = self.headerView.avatarImageView.transform.scaledBy(x: width, y: width)
            self.headerView.avatarImageView.layer.cornerRadius = 50
            self.headerView.shutterView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
            self.headerView.avatarImageView.layoutIfNeeded()
        }, completion: { (true) in
            self.headerView.buttonStop.isHidden = true
            self.headerView.shutterView.layer.zPosition = 0
            self.headerView.shutterView.frame.size = CGSize(width: 116, height: 116)
            self.tableView.isScrollEnabled = true
        })

    }
}


extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        if section == 1 { return posts.count }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.setupCell(post: posts[indexPath.row])
     
            return cell
        }
        return UITableViewCell()
    }


}
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return UITableView.automaticDimension }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PhotosViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }    
}


