//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Валько on 05.11.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    static var postTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "post")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.addSubview(Self.postTableView)
        setupConstraints()
        Self.postTableView.dataSource = self
        Self .postTableView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            Self.postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            Self.postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            Self.postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            Self.postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Self.postTableView.dequeueReusableCell(
            withIdentifier: "post",
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError(
                "The dequeued cell is not an instance of PostTableViewCell."
            )
        }
        cell.fillPost(post: postData[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ProfileHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 240 : 0
    }
    
}
