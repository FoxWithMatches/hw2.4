//
//  WelcomeViewController.swift
//  hw2.3
//
//  Created by Alisa Ts on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet var labelWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWelcome.text = "Welcome, \(user.person.fullName)"
    }
    
}
 
