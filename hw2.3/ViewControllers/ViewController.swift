//
//  ViewController.swift
//  hw2.3
//
//  Created by Alisa Ts on 26.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    private let user = User.getUser()
    
// MARK: - Keyboard Delegate -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        userNameText.returnKeyType = .next
        
        passwordText.delegate = self
        passwordText.returnKeyType = .done
        
        passwordText.isEnabled = true
        passwordText.enablesReturnKeyAutomatically = true
    }

// MARK: - ABActions -
    @IBAction func logInButton() {
        
        guard userNameText.text == user.login && passwordText.text == user.password else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func nameAlert() {
        showAlert(title: "Oops!", message: "Your name is User")
    }
    
    @IBAction func passwordAlert() {
        showAlert(title: "Oops!", message: "Your password is Password")
    }
    
//MARK: - Navigation -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeViewController = viewController as? WelcomeViewController {
                welcomeViewController.user = user
            } else if let navigationViewController = viewController as? UINavigationController {
                let aboutMeViewController = navigationViewController.topViewController as! AboutMeViewController
                aboutMeViewController.user = user
            }
        }
     
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameText.text = ""
        passwordText.text = ""
    }
}

// MARK: - Alert Controller

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordText.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameText {
            passwordText.becomeFirstResponder()
        } else {
            logInButton()
            performSegue(withIdentifier: "dvc", sender: nil)
        }
        return true
    }
}


