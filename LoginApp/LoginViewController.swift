//
//  ViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 24.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private var user = "User"
    private var password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = usernameTF.text
    }
    
    @IBAction func loginButtonPressed() {
        if !loginSuccess() {
            showNotification(
                title: "Invalid login or password",
                message: "Please enter correct login and password") { _ in
                    self.passwordTF.text = ""
                }
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showNotification(title: "Oops!!", message: "You username is '\(user)'")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showNotification(title: "Oops!!", message: "You password is '\(password)'")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: - Private Methods
extension LoginViewController {
    private func loginSuccess() -> Bool {
        usernameTF.text == user && passwordTF.text == password
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showNotification(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            loginButtonPressed()
        }
        return true
    }
}
