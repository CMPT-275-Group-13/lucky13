//
//  MessagingViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Worked on by: Angus Kan, Marco Liang
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
//import Firebase
import MessageKit

//struct Message{
//    var user: String
//    var body: String
//}


class MessagingViewController: MessagesViewController {
    var messages: [Message] = []
    var member: Member!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        member = Member(name: "bluemoon", color: .blue)
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}
    
extension MessagingViewController: MessagesDataSource {
    
    func currentSender() -> SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    func currentSender() -> Sender {
        return Sender(id: member.name, displayName: member.name)
    }
    
    func numberOfSections(
        in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }


    func messageForItem(
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> MessageType {

        return messages[indexPath.section]
    }

    func messageTopLabelHeight(
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> CGFloat {

        return 12
    }

    func messageTopLabelAttributedText(
        for message: MessageType,
        at indexPath: IndexPath) -> NSAttributedString? {

        return NSAttributedString(
          string: message.sender.displayName,
          attributes: [.font: UIFont.systemFont(ofSize: 12)])
    }
}

extension MessagingViewController: MessagesLayoutDelegate {
  func heightForLocation(message: MessageType,
    at indexPath: IndexPath,
    with maxWidth: CGFloat,
    in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    
    return 0
  }
}

extension MessagingViewController: MessagesDisplayDelegate {
  func configureAvatarView(
    _ avatarView: AvatarView,
    for message: MessageType,
    at indexPath: IndexPath,
    in messagesCollectionView: MessagesCollectionView) {
    
    let message = messages[indexPath.section]
    let color = message.member.color
    avatarView.backgroundColor = color
  }
}

extension MessagingViewController: MessageInputBarDelegate {
  func messageInputBar(
    _ inputBar: MessageInputBar,
    didPressSendButtonWith text: String) {
    
    let newMessage = Message(
      member: member,
      text: text,
      messageId: UUID().uuidString)
      
    messages.append(newMessage)
    inputBar.inputTextView.text = ""
    messagesCollectionView.reloadData()
    messagesCollectionView.scrollToBottom(animated: true)
  }
}
