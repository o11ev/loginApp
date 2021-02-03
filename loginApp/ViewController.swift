//
//  ViewController.swift
//  loginApp
//
//  Created by o11ev on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "Opps!", and: "Your name is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Opps!", and: "Your password is Password")
    }
    

}

// MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        // cюда же еще действие при ошибке дописать
        present(alert, animated: true)
    }
}
