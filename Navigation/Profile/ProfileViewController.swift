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
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photo")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(Self.postTableView)
        setupConstraints()
        Self.postTableView.dataSource = self
        Self.postTableView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            Self.postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            Self.postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            Self.postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            Self.postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return postData.count
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = Self.postTableView.dequeueReusableCell(withIdentifier: "photo", for: indexPath) as! PhotosTableViewCell
            return cell
        case 1:
            let cell = Self.postTableView.dequeueReusableCell(
                withIdentifier: "post",
                for: indexPath
            ) as! PostTableViewCell
            cell.fillPost(post: postData[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tableView.deselectRow(at: indexPath, animated: false)
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
}
