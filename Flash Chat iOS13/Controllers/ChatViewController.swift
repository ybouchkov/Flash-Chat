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
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        }
    }
    @IBOutlet weak var messageTextfield: UITextField!
    
    // reference to db
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello!"),
        Message(sender: "1@2.com", body: "What's up?")
    ]
    
    // MARK: - ChatViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        loadMessages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - IBActions: private
    @IBAction
    private func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                                                                K.FStore.senderField: messageSender,
                                                                K.FStore.bodyField: messageBody
            ]) { (error) in
                if let error = error {
                    print("There was an issue saving data in firestore - \(error)")
                } else {
                    print("Successfully saved data!")
                }
            }
        }
    }
    
    @IBAction
    private func logOutBtnPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            // navigate to welcome screen
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

    // MARK: - Private
    private func loadMessages() {
        messages = []
        db.collection(K.FStore.collectionName).getDocuments { [weak self] (querySnapshot, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                print("There was an issue retriving data from Firestor - \(error)")
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for document in snapshotDocument {
                        let data = document.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            strongSelf.messages.append(newMessage)
                            DispatchQueue.main.async {
                                strongSelf.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - UITableViewDelegate & UITableViewDatasource
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageTableViewCell
        cell.config(label: messages[indexPath.row].body)
        return cell
    }
}
