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
    //Initializing Firestore DB
    private let db = Firestore.firestore()
    private var reference: CollectionReference?
    
    //Initialize Messages Array
    var messages: [Message] = []
    private var messageListener: ListenerRegistration?
    
    //TODO: change docID from hardcoded email once myDoctorsView is complete
    private let docId: String = "jinn@sfu.ca"
    
    //TODO: Member needs to work with the login, not hardcoded
    var member: Member = Member(name: "", email: localUserEmail)
    
    //Remove listener on function exit
    deinit {
      messageListener?.remove()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Specifying the DB collection to pull messages from
        reference = db.collection(["messages", docId, member.email].joined(separator: "/"))
        
        //Set up a listener to check for new messages in the DB
        messageListener = reference?.addSnapshotListener { querySnapshot, error in
          guard let snapshot = querySnapshot else {
            print("Error listening for channel updates: \(error?.localizedDescription ?? "No error")")
            return
          }
          snapshot.documentChanges.forEach { change in
            self.handleDocumentChange(change)
          }
        }
        
        //Specifying to use the extensions written below
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        //Removing avatars from the messaging view
        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout{
            layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
            layout.textMessageSizeCalculator.incomingAvatarSize = .zero

        }
        
    }
    
    //MARK: Helpers

    //insertNewMessage
    //Helper function that inserts new messages into the messages array
    //
    private func insertNewMessage(_ message: Message) {
        
        //Check the message contains text
        guard !messages.contains(message) else {
            return
        }
        
        //Append the new message to messages array, then sort by sentDate
        messages.append(message)
        messages.sort{$0.sentDate < $1.sentDate}
        
        //Check whether this message is the latest
        let isLatestMessage = messages.index(of: message) == (messages.count - 1)
        
        //If the new message is the latest message and is not within view, scroll to it
        let shouldScrollToBottom = messagesCollectionView.isAtBottom && isLatestMessage
        
        //Reload the collection view so new message appears
        messagesCollectionView.reloadData()
        
        if shouldScrollToBottom {
            DispatchQueue.main.async {
                self.messagesCollectionView.scrollToBottom(animated: true)
            }
        }
    }
    
    
    //handleDocumentChange
    //Helper function that handles any new changes in the DB
    //
    private func handleDocumentChange(_ change: DocumentChange) {
        
        //This uses the constructor in Message struct to create a message
        //using the data from the DB, converting from document to Message
        guard let message = Message(document: change.document) else {
            return
        }
    
        //Switch based on the change type(added, removed...)
        //Can be expanded later to add functionality such as removing messages
        switch change.type {
            case .added:
                insertNewMessage(message) //insert this new message to array
            
            default:
                
            break
        }
    }
    
    //save
    //Helper function that saves new messages as a document on the DB
    //
    private func save(_ message: Message) {
        reference?.document(message.messageId).setData(
            message.representation
            ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
            
        self.messagesCollectionView.scrollToBottom()
    }

}

//MARK: Extensions for customizing MessageKit
extension MessagingViewController: MessagesDataSource {
    //defining the sender type we used
    func currentSender() -> SenderType {
        return Sender(id: member.email, displayName: member.name)
    }
    
    //returns number of sections in the tableview that shows
    //the messages, should be equal to number of messages
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    //this function isn't used right now, but will return message type in the future
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    //Customizing the top label for each message bubble
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
    //set the background color for the message view
    func backgroundColor(for message: MessageType, at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) -> UIColor {
        //if the message is sent from currentuser, it'll be blue(#A7CED9), otherwise it'll be grey(#DCDCDC)
        return isFromCurrentSender(message: message) ? UIColor(hex: "#A7CED9", alpha: 1) : UIColor(hex: "#DCDCDC", alpha: 1)
    }
    
    //turn off message header
    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) -> Bool {

      return false
    }
    
    //defines messagestyle
    func messageStyle(for message: MessageType, at indexPath: IndexPath,
      in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        
        //if message is sent from current user, tail should be on the right,
        //otherwise it'll be on the left
        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft

        return .bubbleTail(corner, .curved)
    }
    
    //hides avatar in messages
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true
    }
}

extension MessagingViewController: MessagesLayoutDelegate {
    //remove spacing used for the avatar in messaging view
    func avatarSize(for message: MessageType, at indexPath: IndexPath,
    in messagesCollectionView: MessagesCollectionView) -> CGSize {

        return .zero
    }
    
    //spacing of 8 between messages
    func footerViewSize(for message: MessageType, at indexPath: IndexPath,
    in messagesCollectionView: MessagesCollectionView) -> CGSize {

        return CGSize(width: 0, height: 8)
    }
    
    func heightForLocation(message: MessageType, at indexPath: IndexPath,
    with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {

        return 0
    }
    
    //height reserved for the label above messages
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 15
    }
}

extension MessagingViewController: MessageInputBarDelegate{
    
    //defines the inputBar behaviour to send messages on send button press
    func inputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        //puts the text in inputBar into message
        let message = Message(member: member, text: text)
        
        //save the message onto DB
        save(message)
        
        //wipes the inputBar
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

