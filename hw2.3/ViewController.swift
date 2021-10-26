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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        userNameText.returnKeyType = .next
        
        passwordText.delegate = self
        passwordText.returnKeyType = .done
        
        passwordText.isEnabled = true
        passwordText.enablesReturnKeyAutomatically = true
    }

    @IBAction func logInButton() {
        let name = "User"
        guard name == userNameText.text else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            return
        }
        
        let password = "Password"
        guard password == passwordText.text else {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? WelcomeViewController else { return }
        dvc.login = userNameText.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameText.text = ""
        passwordText.text = ""
    }
      
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameText {
            passwordText.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
}


