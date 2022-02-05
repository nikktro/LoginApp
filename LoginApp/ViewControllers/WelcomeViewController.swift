//
//  HelloViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 25.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(view)
        helloLabel.text = "Hello, \(user.person.fullname)!"
    }
}
