//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Валько on 05.11.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override  func viewDidLoad() {
        super.viewDidLoad()

        makeAppearance()
        view.addSubview(profileHeaderView)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.frame = view.frame
    }

    private func makeAppearance () {
        title = "Профиль"
        view.backgroundColor = .lightGray

        tabBarController?.tabBar.backgroundColor = .systemBackground

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}

