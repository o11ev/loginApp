//
//  LoginViewController.swift
//  loginApp
//
//  Created by o11ev on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userOlga = User(
        username: "User",
        password: "Password",
        personData: Person(
            firstName: "Olga",
            lastName: "Dragunova",
            age: 27,
            currentWork: "Designer",
            photo: UIImage(imageLiteralResourceName: "avatar"),
            city: "Saint-Petersburg",
            hobby: "Blogging and Mobile Photography"
        )
    )
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let tabBarController = segue.destination as! UITabBarController
        
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let welcomeVC = viewController as? WelcomeScreenViewController {
                welcomeVC.firstName = userOlga.personData.firstName
                welcomeVC.lastName = userOlga.personData.lastName
            } else if let userDetailsVC = viewController as? UserDetailsViewController {
                userDetailsVC.personData = userOlga.personData
            }
        }
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(title: "Oops!",
                  message: "Your name is \(userOlga.username)")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Oops!",
                  message: "Your password is \(userOlga.password)")
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTextField.text == userOlga.username && passwordTextField.text == userOlga.password {
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
