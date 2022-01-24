//
//  HelloViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 25.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = userName {
            helloLabel.text = "Hello, \(userName)!"
        }
        
    }
}
