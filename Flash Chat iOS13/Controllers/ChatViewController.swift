//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    // MARK: - ChatViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBActions: private
    @IBAction
    private func sendPressed(_ sender: UIButton) {
    }
    
    // MARK: - Private
}
