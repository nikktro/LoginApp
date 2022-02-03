//
//  AboutUserViewController.swift
//  LoginApp
//
//  Created by Nikolay Trofimov on 03.02.2022.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    @IBOutlet var textAboutMe: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(view)
        title = "\(person.name) \(person.surname)"
        textAboutMe.text = person.about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        photoVC.person = person
    }
    
}
