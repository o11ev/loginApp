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
        welcomeVC.userName = user
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(title: "Oops!",
                  message: "Your name is \(user)")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Oops!",
                  message: "Your password is \(password)")
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTextField.text == user && passwordTextField.text == password {
            performSegue(withIdentifier: "loginScreen", sender: nil)
        } else {
            showAlert(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            textField: passwordTextField)
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard Setup
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}
