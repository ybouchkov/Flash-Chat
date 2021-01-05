//
//  MessageTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by Yani Buchkov on 5.01.21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet private weak var messageBubble: UIView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var rightImageView: UIImageView!
    @IBOutlet private weak var leftImageView: UIImageView!
    
    // MARK: - Born of MessageTableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Public: Setup
    func config(label: String) {
        self.label.text = label
    }
    
    func configMeUser() {
        leftImageView.isHidden = true
        rightImageView.isHidden = false
        messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
        label.textColor = UIColor(named: K.BrandColors.purple)
    }
    
    func configYouUser() {
        rightImageView.isHidden = true
        leftImageView.isHidden = false
        messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
        label.textColor = UIColor(named: K.BrandColors.lightPurple)
    }
    
    // MARK: - Private
    private func setup() {
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }
    
    
}
