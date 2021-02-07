//
//  WelcomeScreenViewController.swift
//  loginApp
//
//  Created by o11ev on 03.02.2021.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var firstName = ""
    var lastName = ""
    
    private let primaryColor = UIColor(
        red: 27/255,
        green: 20/255,
        blue: 100/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 237/255,
        green: 30/255,
        blue: 121/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = String("Welcome, \(firstName) \(lastName)")
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        logoutButton.layer.cornerRadius = 5
    }
    
    // без этого экшена почему-то через exit и unwind не работает выход с экрана :(
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
