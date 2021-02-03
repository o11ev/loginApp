//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by o11ev on 03.02.2021.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    var userName: String!
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = String("Welcome, " + userName)
    }
}
