//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Денис Валько on 05.11.2024.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")

        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Кот Хипстер"

        return label
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Сплю..."

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusButton)
        addSubview(statusLabel)

        makeAppearance()
    }

    private func makeAppearance() {

        //Image View
        imageView.frame = CGRect(
            x: 16,
            y: safeAreaInsets.top + 16.0,
            width: 120,
            height: 120
        )
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor

        // Name Label
        nameLabel.frame = CGRect(
            x: imageView.frame.maxX + 27,
            y: safeAreaInsets.top + 27,
            width: bounds.width - imageView.frame.width - 32,
            height: 22
        )

        // Button
        statusButton.frame = CGRect(
            x: 16,
            y: imageView.frame.maxY + 16,
            width: bounds.width - 32,
            height: 50
        )
        statusButton.layer.cornerRadius = 14
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize (width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7

        // Status label
        statusLabel.frame = CGRect(
            x: nameLabel.frame.minX,
            y: statusButton.frame.minY - 52,
            width: bounds.width - imageView.frame.width - 32,
            height: 18
        )

    }

    @objc func buttonPressed(_ sender: UIButton) {
        print(statusLabel.text ?? "Статус не установлен")
        sender.animateButton()
    }
}


