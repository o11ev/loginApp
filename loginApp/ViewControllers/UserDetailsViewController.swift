//
//  UserDetailsViewController.swift
//  loginApp
//
//  Created by o11ev on 07.02.2021.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var workLabel: UILabel!
    
    @IBOutlet var personImageView: UIImageView!
    
    var personData: Person!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = personData.firstName
        lastNameLabel.text = personData.lastName
        ageLabel.text = String(personData.age)
        workLabel.text = personData.currentWork
        
        personImageView.layer.cornerRadius = 20
        personImageView.image = personData.photo
    }
}
