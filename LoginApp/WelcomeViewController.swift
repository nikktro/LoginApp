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
        
        setGradientBackground()
        
        if let userName = userName {
            helloLabel.text = "Hello, \(userName)!"
        }
        
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 10.0/255.0, green: 125.0/255.0, blue: 175.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
