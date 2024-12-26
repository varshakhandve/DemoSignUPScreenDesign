//
//  SignUpScreen.swift
//  DemoSignUPScreenDesign
//
//  Created by Varsha Khandve on 05/12/24.
//

import UIKit

class SignUpScreen: UIViewController {

    // MARK: - UI Components

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        if let logoImage = UIImage(named: "Logo") {
            imageView.image = logoImage
        } else {
            print("Logo image not found!")
        }
        imageView.contentMode = .scaleAspectFit // Ensure the image scales properly
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let signUpTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up for free and start\nmeditating, and explore Medic."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()

    private let nameTextField = SignUpTextField(placeholder: "Name")
    private let emailTextField = SignUpTextField(placeholder: "Email Address", keyboardType: .emailAddress)
    private let passwordTextField = SignUpTextField(placeholder: "Password", isSecure: true)

    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGNUP", for: .normal)
       // button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.titleLabel?.font = UIFont(name: "AlegreyaSans-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 124/255, green: 154/255, blue: 146/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(SignUpScreen.self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()

    // Container for "Already have an account?" and "Sign In" button
    private let loginContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()

    private let loginPromptLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(SignUpScreen.self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 37/255, green: 51/255, blue: 52/255, alpha: 1.0)
        setupUI()
    }

    // MARK: - Setup UI

    private func setupUI() {
        // Add subviews
        [logoImageView, signUpTitleLabel, subtitleLabel,
         nameTextField, emailTextField, passwordTextField,
         signUpButton, loginContainerView].forEach { view.addSubview($0) }
        
        // Add elements to the login container
        loginContainerView.addArrangedSubview(loginPromptLabel)
        loginContainerView.addArrangedSubview(loginButton)

        setupConstraints()
    }

    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        loginContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Logo
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20), // Align logo to the left
            logoImageView.heightAnchor.constraint(equalToConstant: 180),
            logoImageView.widthAnchor.constraint(equalToConstant: 160),

            // Sign-Up Title
            signUpTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            signUpTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: signUpTitleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Name TextField
            nameTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            // Email TextField
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            // Sign-Up Button
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),

            // Login Container View (Center horizontally and position below the sign-up button)
            loginContainerView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
            loginContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    // MARK: - Actions

    @objc private func signUpButtonTapped() {
        print("Sign-Up button tapped")
    }

    @objc private func loginButtonTapped() {
        print("Log-In button tapped")
    }
}

// MARK: - Custom TextField
class SignUpTextField: UIView {

    private let textField = UITextField()
    private let underline = UIView()

    init(placeholder: String, keyboardType: UIKeyboardType = .default, isSecure: Bool = false) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder, keyboardType: keyboardType, isSecure: isSecure)
        setupUnderline()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextField(placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool) {
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = .none
        textField.isSecureTextEntry = isSecure
        textField.keyboardType = keyboardType
        textField.textColor = .white // Ensure text color is white for visibility
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray] // Placeholder color
        )
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        addSubview(textField)
    }

    private func setupUnderline() {
        underline.backgroundColor = .lightGray
        addSubview(underline)
    }

    private func setupConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        underline.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),

            underline.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            underline.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            underline.heightAnchor.constraint(equalToConstant: 1),

            bottomAnchor.constraint(equalTo: underline.bottomAnchor)
        ])
    }

    @objc private func textFieldEditingChanged() {
        underline.backgroundColor = textField.text?.isEmpty == true ? .lightGray : .white
    }
}
