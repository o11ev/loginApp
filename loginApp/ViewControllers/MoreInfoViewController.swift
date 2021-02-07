//
//  MoreInfoViewController.swift
//  loginApp
//
//  Created by o11ev on 07.02.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    var personDataDetail: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = personDataDetail.city
        hobbyLabel.text = personDataDetail.hobby
    }
}
