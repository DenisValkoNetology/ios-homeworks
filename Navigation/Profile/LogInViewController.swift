//
//  LogInViewController.swift
//  Navigation
//
//  Created by Денис Валько on 09.11.2024.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()

        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.backgroundColor = .systemRed

        return contentView
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var loginField: UITextField = {
        let login = UITextField()

        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Email or phone"
        login.autocapitalizationType = .none
        login.textColor = .black
        login.font = .systemFont(ofSize: 16)
        login.returnKeyType = .done
        login.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        login.leftViewMode = .always
        login.delegate = self

        return login
    }()

    private lazy var passwordField: UITextField = {
        let password = UITextField()

        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.autocapitalizationType = .none
        password.textColor = .black
        password.font = .systemFont(ofSize: 16)
        password.returnKeyType = .done
        password.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        password.leftViewMode = .always
        password.delegate = self


        return password
    }()

    private lazy var separator: UIView = {
        let separator = UIView()

        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray

        return separator
    }()

    private lazy var loginPasswordView: UIStackView = {
        let stackView = UIStackView()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.layer.masksToBounds = true
        stackView.distribution = .fillProportionally
        stackView.layer.cornerRadius = 10.0
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5

        stackView.addArrangedSubview(loginField)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(passwordField)

        return stackView
    }()

    private lazy var logInButton: MyButton = {
        let button = MyButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10

        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }

    private func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }

    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120.0),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 100.0),
        ])

        NSLayoutConstraint.activate([
            loginPasswordView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120.0),
            loginPasswordView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            loginPasswordView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 100.0)
        ])

        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            logInButton.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16.0),
            logInButton.heightAnchor.constraint(equalToConstant: 50.0),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }

    private func addSubviews() {
        view.addSubview(scrollView)

        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginPasswordView)
        contentView.addSubview(logInButton)
    }

    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    @objc func willShowKeyboard(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentOffset.y = keyboardSize.height - (scrollView.frame.height - logInButton.frame.minY - 16.0)
            scrollView.isScrollEnabled = false        }
    }

    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.isScrollEnabled = true
        scrollView.scrollToBottom(animated: false)

    }

    @objc func buttonPressed(_ sender: UIButton) {
        let profileViewController = ProfileViewController()

        sender.animateButton()
        loginField.text = ""
        passwordField.text = ""
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
        self.resignFirstResponder()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

extension UIScrollView {
   func scrollToBottom(animated: Bool) {
     if self.contentSize.height < self.bounds.size.height { return }
     let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
     self.setContentOffset(bottomOffset, animated: animated)
  }
}
