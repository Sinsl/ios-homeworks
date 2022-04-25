//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let posts = Post.makePosts()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        return tableView
    }()
    
    private let headerView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
        setAnimation()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.setupCell(post: posts[indexPath.row])
 
        return cell
    }


}
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
}


