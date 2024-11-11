//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Денис Валько on 05.11.2024.
//

import UIKit

class ProfileHeaderView: UIView {

    private let initialStatus = "Сплю..."

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "cat")
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 60.0

        return imageView
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Кот Хипстер"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)

        button.backgroundColor = .systemBlue
        button.setTitle("Установить статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = initialStatus

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var statusTextField: UITextField = {
        let text = UITextField()
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))

        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.placeholder = "Введите статус"
        text.backgroundColor = .white
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leftViewMode = .always
        text.leftView = spacerView

        text.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        text.addTarget(self, action: #selector(returnPressed(_:)), for: .primaryActionTriggered)

        return text
    }()

    private lazy var statusText = initialStatus

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)

        setupConstraints()
    }

    private func setupConstraints() {
        let safeAreaGuide = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120.0),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120.0),

            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15.0),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 27.0),

            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 35.0),

            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10.0),
            statusTextField.heightAnchor.constraint(equalToConstant: 40.0),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),

            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
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


