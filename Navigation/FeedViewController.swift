//
//  FeedViewController.swift
//  Navigation
//
//  Created by Денис Валько on 04.11.2024.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Какой-то пост")

    private lazy var postButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти в пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(postButton)
        makeAppearance()
    }

    private func makeAppearance() {
        title = "Лента"
        view.backgroundColor = .systemBackground
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -50.0
            ),
            postButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            postButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            postButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    @objc func buttonPressed(_ sender: UIButton) {
        sender.animateButton()
        
        let postViewController = PostViewController()
        postViewController.titleOfPost = post.title

        navigationController?.pushViewController(postViewController, animated: true)
    }
}
