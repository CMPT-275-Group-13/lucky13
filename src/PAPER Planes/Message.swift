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
//TODO: Add UID
    let name: String
    let email: String
}

struct Message: MessageType {
//    var messageId: String
    var sender: SenderType
    var sentDate: Date
    
//    let member: Member
    let text: String
    let id: String?
//    let sentDate: Date
//    let sender: Sender
    
    init(member: Member, text: String){
//        member = member
        self.text = text
        sender = Sender(id: member.email, displayName: member.name)
        sentDate = Date()
//        messageId = UUID().uuidString
        id = nil
    }
    
    var messageId: String{
        return id ?? UUID().uuidString
    }
    
//    var sender: SenderType {
//      return Sender(id: member.email, displayName: member.name)
//    }

//    var sentDate: Date {
//        return Date()
//    }

    var kind: MessageKind {
        return .text(text)
    }
    
//    var downloadURL: URL? = nil

    init?(document: QueryDocumentSnapshot) {
        print("0")
        let data = document.data()

        let timestamp : Timestamp = data["sentDate"] as! Timestamp
        let sentDate = Date(timeIntervalSince1970: TimeInterval(timestamp.seconds))

        
//        guard let sentDate = Date(timeIntervalSince1970: TimeInterval(timestamp.seconds)) as? Date else {
//        print(date)
//        print("1")
//        return nil
//    }
    guard let senderID = data["author"] as? String else {
        print("2")
        return nil
    }
    guard let displayName = data["authorName"] as? String else{
        print("3")
        return nil
    }
      
      id = document.documentID
      
      self.sentDate = sentDate
      sender = Sender(id: senderID, displayName: displayName)
        
        print("4")
      if let body = data["body"] as? String {
        self.text = body
//        downloadURL = nil
//      } else if let urlString = data["url"] as? String, let url = URL(string: urlString) {
//        downloadURL = url
//        content = ""
      } else {
        return nil
      }
        
    }
    
}

extension Message: Equatable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}


extension Message: DatabaseRepresentation {
  
  var representation: [String : Any] {
    let rep: [String : Any] = [
        "author": sender.senderId,
        "sentDate": sentDate,
        "body": text,
        "authorName" : sender.displayName
    ]
//
//    if let url = downloadURL {
//      rep["url"] = url.absoluteString
//    } else {
//      rep["body"] = text
//    }
    
    return rep
  }
  
}
