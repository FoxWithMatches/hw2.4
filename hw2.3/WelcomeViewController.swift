//
//  WelcomeViewController.swift
//  hw2.3
//
//  Created by Alisa Ts on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var login: String?
    @IBOutlet var labelWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = self.login else { return }
        labelWelcome.text = "Welcome, \(login)"
    }
    
}
 
