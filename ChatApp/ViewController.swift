//
//  ViewController.swift
//  ChatApp
//
//  Created by Sriram Prasad on 30/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit


class Dateheaderlabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .white
        backgroundColor = .black
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height/2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
}


struct ChatMessages {
    var text: String
    var isIncoming: Bool
    var date: Date
}
extension Date {
    static func dateFromCustomString(customString :String)-> Date{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/mm/yyy"
        return dateformatter.date(from: customString) ?? Date()
        
        
        
    }
    
}


class ViewController: UITableViewController {
    fileprivate let cellId = "Cell"
    //    let chatMessages = [
    //        [
    //            ChatMessages(text: "This is my first message", isIncoming: true,date:Date.dateFromCustomString(customString: "10/2/2018")),
    //            ChatMessages(text: "this my swecond message and its to long for official use only in this app", isIncoming: true,date:Date.dateFromCustomString(customString: "10/2/2018"))
    //        ],
    //
    //        [
    //            ChatMessages(text: "Attorney General of India since 2014The Attorney General for India is the Indian government's chief legal advisor, and its primary lawyer in the Supreme Court of India. He is appointed by the President of India under Article 76(1) of the Constitution and holds office during the pleasure of the President.", isIncoming: false,date:Date.dateFromCustomString(customString: "14/3/2018")),
    //            ChatMessages(text: "wow  super", isIncoming: false,date:Date.dateFromCustomString(customString: "11/4/2018")),
    //            ChatMessages(text: "This Method Should apper on left side", isIncoming: true,date:Date.dateFromCustomString(customString: "11/4/2018"))
    //            ],
    //        [ ChatMessages(text: "third setion in the table", isIncoming: true,date:Date.dateFromCustomString(customString: "15/5/2018") )
    //        ]
    //    ]
    
    let chatMesagesFromServer = [
        
        ChatMessages(text: "This is my first message", isIncoming: true,date:Date.dateFromCustomString(customString: "10/2/2018")),
        ChatMessages(text: "this my swecond message and its to long for official use only in this app", isIncoming: true,date:Date.dateFromCustomString(customString: "10/2/2018")),
        ChatMessages(text: "Attorney General of India since 2014The Attorney General for India is the Indian government's chief legal advisor, and its primary lawyer in the Supreme Court of India. He is appointed by the President of India under Article 76(1) of the Constitution and holds office during the pleasure of the President.", isIncoming: false,date:Date.dateFromCustomString(customString: "14/3/2018")),
        ChatMessages(text: "wow  super", isIncoming: false,date:Date.dateFromCustomString(customString: "11/4/2018")),
        ChatMessages(text: "This Method Should apper on left side", isIncoming: true,date:Date.dateFromCustomString(customString: "11/4/2018")),
        ChatMessages(text: "third setion in the table", isIncoming: true,date:Date.dateFromCustomString(customString: "15/5/2018") )
        
    ]
    
    var chatMessages = [[ChatMessages]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        attemptAssembleGroupMessages()
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    fileprivate func attemptAssembleGroupMessages(){
        let groupingMessages = Dictionary.init(grouping: chatMesagesFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedmessages = groupingMessages.keys.sorted()
        sortedmessages.forEach { (keys) in
            let values = groupingMessages[keys]
            chatMessages.append(values ?? [])

        }
       
//        groupingMessages.keys.forEach { (key) in
//            print(key)
//            let values = groupingMessages[key]
//            print(values)
//            chatMessages.append(values ?? [])
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
        
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInsection = chatMessages[section].first{
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/DD/YYYY"
            let datestring = dateformatter.string(from: firstMessageInsection.date)
           
            let label = Dateheaderlabel()
            label.text = datestring
            
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            return containerView
            
        }
        return nil
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if let firstMessageInsection = chatMessages[section].first{
    //            let dateformatter = DateFormatter()
    //                dateformatter.dateFormat = "MM/DD/YYYY"
    //                let datestring = dateformatter.string(from: firstMessageInsection.date)
    //            return datestring
    //        }
    ////
    //
    //        return "Section\(Date())"
    //    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageTableViewCell
        
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        //            cell.messageLabel.text = chatMessage.text
        //            cell.isIncoming = chatMessage.isIncoming
        cell.chatmessages = chatMessage
        return cell
    }
    
}

