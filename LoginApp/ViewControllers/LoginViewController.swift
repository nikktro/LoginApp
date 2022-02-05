//
//  ViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 24.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private var user = User.getUserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutUserVC = navigationVC.topViewController as? AboutUserViewController else { return }
                aboutUserVC.user = user
            }
        }
    }
    
    // MARK: IBActions
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
        showNotification(title: "Oops!!", message: "You username is '\(user.login)'")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showNotification(title: "Oops!!", message: "You password is '\(user.password)'")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: - Private Methods
extension LoginViewController {
    private func loginSuccess() -> Bool {
        usernameTF.text == user.login && passwordTF.text == user.password
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
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
