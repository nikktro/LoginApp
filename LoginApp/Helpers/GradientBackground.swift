//
//  GradientBackground.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 03.02.2022.
//

import UIKit

func setGradientBackground(_ view: UIView) {
    let colorTop =  UIColor(red: 255.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 10.0/255.0, green: 125.0/255.0, blue: 175.0/255.0, alpha: 1.0).cgColor
                
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = view.bounds
            
    view.layer.insertSublayer(gradientLayer, at: 0)
}
