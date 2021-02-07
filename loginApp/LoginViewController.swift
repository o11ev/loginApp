//
//  ViewController.swift
//  loginApp
//
//  Created by o11ev on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeScreenViewController else { return }
        welcomeVC.userName = usernameTextField.text
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "Opps!", and: "Your name is \(user))")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Opps!", and: "Your password is \(password)")
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTextField.text == user && passwordTextField.text == password {
            performSegue(withIdentifier: "loginScreen", sender: nil)
        } else {
            showCancelMessage(with: "Invalid login or password", and: "Please, enter correct login and password")
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    private func showCancelMessage(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
