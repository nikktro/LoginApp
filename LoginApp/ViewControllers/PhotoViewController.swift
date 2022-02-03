//
//  PhotoViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 03.02.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var photoAboutMe: UIImageView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(view)
        photoAboutMe.image = UIImage(named: person.photo)
    }
    
}
