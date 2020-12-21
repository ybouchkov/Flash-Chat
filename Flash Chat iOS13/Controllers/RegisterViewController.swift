//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    static let RegisterToChatSegue = "RegisterToChat"
    
    // MARK: - RegisterViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction
    private func registerPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text,
              let password = passwordTextfield.text else {
            print("NO EMAIL, OR PASSWORD!!!")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let strongSelf = self else {
                return
            }
            // navigate to chat view controller
            strongSelf.performSegue(withIdentifier: RegisterViewController.RegisterToChatSegue, sender: self)
        }
    }
    
    // MARK: - Private
}
