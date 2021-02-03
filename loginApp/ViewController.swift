//
//  ViewController.swift
//  loginApp
//
//  Created by o11ev on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "Opps!", and: "Your name is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Opps!", and: "Your password is Password")
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTextField.text == "User" && passwordTextField.text == "Password" {
            performSegue(withIdentifier: "loginScreen", sender: nil)
        } else {
            showCancelMessage(with: "RR", and: "EE")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeScreenViewController else { return }
        welcomeVC.userName = usernameTextField.text
    }
}

// MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController {
    private func showCancelMessage(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
