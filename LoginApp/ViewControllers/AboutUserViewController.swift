//
//  AboutUserViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 03.02.2022.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    @IBOutlet var textAboutMe: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(view)
        title = user.person.fullname
        textAboutMe.text = user.person.about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        photoVC.user = user
    }
    
}
