//
//  AboutMeViewController.swift
//  hw2.3
//
//  Created by Alisa Ts on 29.10.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var greeting: UILabel!
    @IBOutlet var aboutMe: UILabel!

    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = user.person.fullName
        
        greeting.text = user.person.greetings
        aboutMe.text = user.person.aboutOfPerson
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreAboutViewController = segue.destination as? MoreAboutViewController else { return }
        moreAboutViewController.user = user
    }

}
