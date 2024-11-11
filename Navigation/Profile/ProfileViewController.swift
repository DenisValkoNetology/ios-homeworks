//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Денис Валько on 05.11.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var setTitleButton: UIButton = {
        var button = UIButton(type: .system)

        button.setTitle("Изменить заголовок", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        view.addSubview(profileHeaderView)
        view.addSubview(setTitleButton)
        makeAppearance()
        setupConstraints()
    }

    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0.0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0.0),
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 0.0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220.0),

            setTitleButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            setTitleButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            setTitleButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
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

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

