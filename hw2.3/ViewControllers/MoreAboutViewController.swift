//
//  MoreAboutViewController.swift
//  hw2.3
//
//  Created by Alisa Ts on 30.10.2021.
//

import UIKit

class MoreAboutViewController: UIViewController {

    @IBOutlet var moreAboutMe: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreAboutMe.text = user.person.aboutOfPerson
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let lastViewController = segue.destination as? LastViewController else { return }
        lastViewController.user = user
    }

}
