//
//  MessagingViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Worked on by: Angus Kan, Marco Liang
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import MessageKit

//struct Message{
//    var user: String
//    var body: String
//}

class MessagingViewController: MessagesViewController {
    var messages: [Message] = []
    var member: Member = Member(name: "John")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout{
            layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
            layout.textMessageSizeCalculator.incomingAvatarSize = .zero

        }
        
    }
    
    //MARK: Helpers
    private func insertNewMessage(_ message: Message) {
      guard !messages.contains(message) else {
        return
      }
      
      messages.append(message)
      messages.sort{$0.sentDate < $1.sentDate}
      
      let isLatestMessage = messages.index(of: message) == (messages.count - 1)
      let shouldScrollToBottom = messagesCollectionView.isAtBottom && isLatestMessage
      
      messagesCollectionView.reloadData()
      
      if shouldScrollToBottom {
        DispatchQueue.main.async {
          self.messagesCollectionView.scrollToBottom(animated: true)
        }
      }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      let testMessage = Message(member: member, text: "I love pizza, what is your favorite kind?")
      insertNewMessage(testMessage)
    }
    
}
    
extension MessagingViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType
    {
        return messages[indexPath.section]
    }
    
    func cellTopLabelAttributedText(for message: MessageType,
       at indexPath: IndexPath) -> NSAttributedString? {

        let name = message.sender.displayName
        return NSAttributedString(
         string: name,
         attributes: [
            .font: UIFont.preferredFont(forTextStyle: .caption1),
            .foregroundColor: UIColor(white: 0.3, alpha:1),
         ]
       )
     }
}

extension MessagingViewController: MessagesDisplayDelegate {
    func backgroundColor(for message: MessageType, at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) -> UIColor {
      
        return isFromCurrentSender(message: message) ? UIColor(hex: "#A7CED9", alpha: 1) : UIColor(hex: "#DCDCDC", alpha: 1)
    }

    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) -> Bool {

      return false
    }

    func messageStyle(for message: MessageType, at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) -> MessageStyle {

      let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft

      return .bubbleTail(corner, .curved)
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true
    }
}

extension MessagingViewController: MessagesLayoutDelegate {
      func avatarSize(for message: MessageType, at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> CGSize {

        return .zero
      }

      func footerViewSize(for message: MessageType, at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> CGSize {

        return CGSize(width: 0, height: 8)
      }

      func heightForLocation(message: MessageType, at indexPath: IndexPath,
        with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {

        return 0
      }
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 15
    }
}

extension UIScrollView{
    var isAtBottom: Bool{
        return contentOffset.y >= verticalOffsetForBottom
    }
    
    var verticalOffsetForBottom: CGFloat{
        let scrollViewHeight = bounds.height
        let scrollContentSizeHeight = contentSize.height
        let bottomInset = contentInset.bottom
        let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
        return scrollViewBottomOffset
    }
}

