//
//  InfoViewController.swift
//  Navigation
//
//  Created by Денис Валько on 04.11.2024.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(alertButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            alertButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            alertButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            alertButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            alertButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])

        alertButton.addTarget(self, action: #selector(alertPressed(_:)), for: .touchUpInside)

    }

    @objc func alertPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Алерт!", message: "Отправить в консоль?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: {_ in 
            print("Сообщение отправлено в консоль")
        }))

        present(alert, animated: true)
    }

}
