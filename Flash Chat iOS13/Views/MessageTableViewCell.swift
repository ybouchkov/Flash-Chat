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
    
    // MARK: - Born of MessageTableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Public: Setup
    func config(label: String) {
        self.label.text = label
    }
    
    // MARK: - Private
    private func setup() {
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }
}
