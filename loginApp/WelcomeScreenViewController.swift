//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by o11ev on 03.02.2021.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = String("Welcome, " + userName)
    }
    
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}
