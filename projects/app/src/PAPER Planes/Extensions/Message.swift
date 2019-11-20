//
//  Message.swift
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-17.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import Foundation
import UIKit
import MessageKit
import Firebase
import FirebaseFirestore

struct Member {
    // creating a structure that has variables for the member's name and email
    let name: String
    let email: String
}

struct Message: MessageType {
    //creating a structure that has the variables for the contents and labels of the message
    var sender: SenderType
    var sentDate: Date
    let text: String
    let id: String?

    init(member: Member, text: String){
        // initializing the message contents, who sent the message, and when the message was sent
        self.text = text
        sender = Sender(id: member.email, displayName: member.name)
        sentDate = Date()
        id = nil
    }
    
    var messageId: String{
        return id ?? UUID().uuidString
    }

    var kind: MessageKind {
        return .text(text)
    }
    

    init?(document: QueryDocumentSnapshot) {
        //takes a snapshot of the data in our database
        let data = document.data()
        let timestamp : Timestamp = data["sentDate"] as! Timestamp
        let sentDate = Date(timeIntervalSince1970: TimeInterval(timestamp.seconds))

    //checking if there is data inside the field author
    guard let senderID = data["author"] as? String else {
        return nil
    }
    //checking if there is data inside the field authorName
    guard let displayName = data["authorName"] as? String else{
        return nil
    }
      
      id = document.documentID
      
      self.sentDate = sentDate
      sender = Sender(id: senderID, displayName: displayName)
        
      if let body = data["body"] as? String {
        self.text = body
      } else {
        return nil
      }
        
    }
    
}

extension Message: Equatable{
    // defining what == means
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}


extension Message: DatabaseRepresentation {
  //returns field values from the data base as variables for our program to use
  var representation: [String : Any] {
    let rep: [String : Any] = [
        "author": sender.senderId,
        "sentDate": sentDate,
        "body": text,
        "authorName" : sender.displayName
    ]
    return rep
  }
  
}
