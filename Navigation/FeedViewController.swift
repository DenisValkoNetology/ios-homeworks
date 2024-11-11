//
//  FeedViewController.swift
//  Navigation
//
//  Created by Денис Валько on 04.11.2024.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Какой-то пост")

    private lazy var postButton1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти в пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10

        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var postButton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Перейти в пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10.0

        stackView.addArrangedSubview(postButton1)
        stackView.addArrangedSubview(postButton2)

        return stackView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)
        makeAppearance()
    }

    private func makeAppearance() {
        title = "Лента"
        view.backgroundColor = .systemBackground
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),

            postButton1.heightAnchor.constraint(equalToConstant: 50.0),
            postButton2.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    @objc func buttonPressed(_ sender: UIButton) {
        sender.animateButton()
        
        let postViewController = PostViewController()
        postViewController.titleOfPost = post.title

        navigationController?.pushViewController(postViewController, animated: true)
    }
}
