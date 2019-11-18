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
import FirebaseFirestore


class MessagingViewController: MessagesViewController {
    private let db = Firestore.firestore()
    private var reference: CollectionReference?
    private let docId: String = "jinn@sfu.ca"
    
    var messages: [Message] = []
    var member: Member = Member(name: "John", email: "csmith@gmail.com")
    private var messageListener: ListenerRegistration?

    deinit {
      messageListener?.remove()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reference = db.collection(["messages", docId, member.email].joined(separator: "/"))
        // Do any additional setup after loading the view.
        
        messageListener = reference?.addSnapshotListener { querySnapshot, error in
            print ("messageListener")
          guard let snapshot = querySnapshot else {
            print("Error listening for channel updates: \(error?.localizedDescription ?? "No error")")
            return
          }
//          print("LISTENER LISTENING")
          snapshot.documentChanges.forEach { change in
            self.handleDocumentChange(change)
            print("CHANGED")
          }
        }
        
        messageInputBar.delegate = self
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
        print ("insertNewMessage1")
      messages.sort{$0.sentDate < $1.sentDate}
        print ("insertNewMessage2")
      
      let isLatestMessage = messages.index(of: message) == (messages.count - 1)
      let shouldScrollToBottom = messagesCollectionView.isAtBottom && isLatestMessage
      print ("insertNewMessage3")
      messagesCollectionView.reloadData()
      print ("insertNewMessage4")
      if shouldScrollToBottom {
        print ("insertNewMessage")
        DispatchQueue.main.async {
          self.messagesCollectionView.scrollToBottom(animated: true)
        }
      }
    }
    
    private func handleDocumentChange(_ change: DocumentChange) {
        print("handle3")
//      guard var message = Message(document: change.document) else {
//        return
//      }
        guard let message = Message(document: change.document) else { return  }
        
        print ("handle1")
      switch change.type {
      case .added:
        print ("handle2")

        insertNewMessage(message)
      default:
        break
      }
    }
    
    private func save(_ message: Message) {
      reference?.addDocument(data: message.representation) { error in
        if let e = error {
          print("Error sending message: \(e.localizedDescription)")
          return
        }
        
        self.messagesCollectionView.scrollToBottom()
      }
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

extension MessagingViewController: MessageInputBarDelegate{
    
    func inputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {

//    print("hello")
      // 1
      let message = Message(member: member, text: text)

      // 2
      save(message)

      // 3
      inputBar.inputTextView.text = ""
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

