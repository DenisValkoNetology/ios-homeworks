//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Денис Валько on 05.11.2024.
//

import UIKit

class ProfileHeaderView: UIView {

    private let initialStatus = "Сплю..."

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "cat")
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor

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
        button.setTitle("Установить статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7

        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = initialStatus

        return label
    }()

    private lazy var textField: UITextField = {
        let text = UITextField()
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.placeholder = "Введите статус"
        text.backgroundColor = .white
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor

        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        text.leftViewMode = .always
        text.leftView = spacerView

        text.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        text.addTarget(self, action: #selector(returnPressed(_:)), for: .primaryActionTriggered)

        return text
    }()

    private lazy var statusText = initialStatus

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusButton)
        addSubview(statusLabel)
        addSubview(textField)

        makeLayout()
    }

    private func makeLayout() {

        //Image View
        imageView.frame = CGRect(
            x: safeAreaInsets.left + 16.0,
            y: safeAreaInsets.top + 16.0,
            width: 120,
            height: 120
        )
        imageView.layer.cornerRadius = imageView.frame.width / 2

        // Name Label
        nameLabel.frame = CGRect(
            x: imageView.frame.maxX + 27,
            y: safeAreaInsets.top + 27,
            width: bounds.width - imageView.frame.maxX - 43,
            height: 22
        )

        // Status label
        statusLabel.frame = CGRect(
            x: nameLabel.frame.minX,
            y: nameLabel.frame.maxY + 40,
            width: bounds.width - imageView.frame.maxX - 43,
            height: 18
        )

        // Text Field
        textField.frame = CGRect(
            x: nameLabel.frame.minX,
            y: statusLabel.frame.maxY + 10,
            width: bounds.width - imageView.frame.maxX - 43 - safeAreaInsets.right,
            height: 40
        )

        // Button
        statusButton.frame = CGRect(
            x: imageView.frame.minX,
            y: textField.frame.maxY + 20,
            width: bounds.width - safeAreaInsets.left - safeAreaInsets.right - 32.0,
            height: 50
        )
    }

    @objc func buttonPressed(_ sender: UIButton) {
        endEditing(true)
        statusLabel.text = statusText
        print(statusLabel.text ?? "Статус не установлен")

        sender.animateButton()
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Статус не установлен"
    }

    @objc func returnPressed(_ textField: UITextField) {
        endEditing(true)
        statusLabel.text = statusText
        print(statusLabel.text ?? "Статус не установлен")
        }
}


