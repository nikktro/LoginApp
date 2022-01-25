//
//  ViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 24.01.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let helloVC = segue.destination as? WelcomeViewController else { return }
        helloVC.userName = userNameTF.text
    }
    
    @IBAction func loginButtonPressed() {
        if loginSuccess() {
            performSegue(withIdentifier: "loginSuccess", sender: nil)
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showNotification(title: "Oops!!", message: "You username is 'User'")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showNotification(title: "Oops!!", message: "You password is 'Password'")
    }
    
    @IBAction func unwindToLoginVC(_ unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

extension LoginViewController {
    
    private func showNotification(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    private func loginSuccess() -> Bool {
        if userNameTF.text == "User" && passwordTF.text == "Password" {
            return true
        }
        
        showNotification(
            title: "Invalid login or password",
            message: "Please enter correct login and password") { _ in
                self.passwordTF.text = ""
            }
        
        return false
    }
    
}
