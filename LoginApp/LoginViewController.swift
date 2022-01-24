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
        showNotification(title: "OOPS!!", message: "You username is 'User'")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showNotification(title: "OOPS!!", message: "You password is 'Password'")
    }
    
}

extension LoginViewController {
    
    private func showNotification(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    private func loginSuccess() -> Bool {
        // TODO: add login check logic
        return true
    }
    
}
