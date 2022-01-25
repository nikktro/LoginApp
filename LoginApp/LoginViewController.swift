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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let helloVC = segue.destination as? WelcomeViewController else { return }
        helloVC.userName = usernameTF.text
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
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            textField.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.resignFirstResponder()
            loginButtonPressed()
        }
        return true
    }
    
    private func showNotification(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    private func loginSuccess() -> Bool {
        if usernameTF.text == "User" && passwordTF.text == "Password" {
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
