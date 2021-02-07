//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by o11ev on 03.02.2021.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    var firstName = ""
    var lastName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = String("Welcome, \(firstName) \(lastName)")
    }
    
    // без этого экшена почему-то через exit и unwind не работает выход с экрана :(
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}
