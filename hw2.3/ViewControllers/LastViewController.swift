//
//  LastViewController.swift
//  hw2.3
//
//  Created by Alisa Ts on 30.10.2021.
//

import UIKit

class LastViewController: UIViewController {

    @IBOutlet var text: UILabel!
    
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        text.text = user.person.exampleJob
    
    }
    

}
