//
//  ChatMessageTableViewCell.swift
//  ChatApp
//
//  Created by Sriram Prasad on 30/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {
let messageLabel = UILabel()
    
    let bubbleBackgroundView = UIView()
    var leadingConstraint:NSLayoutConstraint!
    var trailingConstriant:NSLayoutConstraint!

    var chatmessages:ChatMessages! {
        didSet {
            bubbleBackgroundView.backgroundColor =  chatmessages.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatmessages.isIncoming ? .black : .white
            messageLabel.text = chatmessages.text
            if chatmessages.isIncoming {
                leadingConstraint.isActive = true
                trailingConstriant.isActive = false
            }
            else{
                leadingConstraint.isActive = false
                trailingConstriant.isActive = true

            }
        }
    }
    
//    var isIncoming: Bool!{
//        didSet {
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 16
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
//        messageLabel.backgroundColor = UIColor.green
//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        messageLabel.text = " Attorney General of India since 2014The Attorney General for India is the Indian government's chief legal advisor, and its primary lawyer in the Supreme Court of India. He is appointed by the President of India under Article 76(1) of the Constitution and holds office during the pleasure of the President."
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor,constant: 16),
             messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -32),
             messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
             
             bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor,constant: -16),
             bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor,constant: -16),
             bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor,constant: 16),
             bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 16),
        
        ]
        NSLayoutConstraint.activate(constraints)
        
       leadingConstraint =  messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 32)
         trailingConstriant = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -32)
        trailingConstriant.isActive = true

        leadingConstraint.isActive = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
