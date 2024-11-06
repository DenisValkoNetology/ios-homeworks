//
//  InfoViewController.swift
//  Navigation
//
//  Created by Денис Валько on 04.11.2024.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(alertPressed(_:)), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(alertButton)
        makeAppearance()
    }

    private func makeAppearance() {
        view.backgroundColor = .systemBackground

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
    }

    @objc func alertPressed(_ sender: UIButton) {
        sender.animateButton()
        
        let alert = UIAlertController(title: "Алерт!", message: "Отправить в консоль?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: {_ in 
            print("Сообщение отправлено в консоль")
        }))

        present(alert, animated: true)
    }

}
