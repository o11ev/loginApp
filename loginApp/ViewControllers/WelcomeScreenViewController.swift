//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by o11ev on 03.02.2021.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    var personName = ""
    var personSurname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = String("Welcome, \(personName) \(personSurname)")
    }
    
    // без этого экшена почему-то через exit и unwind не работает выход с экрана :(
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}
