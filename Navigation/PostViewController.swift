//
//  PostViewController.swift
//  Navigation
//
//  Created by Денис Валько on 04.11.2024.
//

import UIKit

class PostViewController: UIViewController {

    var titleOfPost: String = "Неизвестно"


    override func viewDidLoad() {
        super.viewDidLoad()

        title = titleOfPost
        view.backgroundColor = .systemGray4

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(infoPressed(_:)))
    }

    @objc func infoPressed(_ sender: UIButton) {
        let infoViewController = InfoViewController()

        infoViewController.modalTransitionStyle = .flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet

        present(infoViewController, animated: true)
    }

}
