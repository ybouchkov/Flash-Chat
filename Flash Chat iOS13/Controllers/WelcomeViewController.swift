//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    // MARK: - WelcomeViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupAnimation()
        setupCLTypeLabel()
    }
    
    // MARK: - Private
    private func setupAnimation() {
        titleLabel.text = ""
        var characterIndex = 0
        let titleText = "⚡️FlashChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(characterIndex), repeats: false) { [weak self] timer in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.titleLabel.text?.append(letter)
            }
            characterIndex += 1
        }
    }
    
    private func setupCLTypeLabel() {
        titleLabel.text = "⚡️FlashChat"
    }
}
