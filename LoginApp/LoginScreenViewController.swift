//
//  ViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 24.01.2022.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func forgotNameButtonPressed() {
        showNotification(title: "OOPS!!", message: "You username is 'User'")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showNotification(title: "OOPS!!", message: "You password is 'Password'")
    }
    
}

extension LoginScreenViewController {
    
    private func showNotification(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
}
