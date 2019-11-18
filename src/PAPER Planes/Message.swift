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

struct Member {
//TODO: Add UID
  let name: String
}

struct Message {
    let member: Member
    let text: String
    let id: String?
    let sentDate: Date
//    let sender: Sender
    
    init(member: Member, text: String){
        self.member = member
        self.text = text
        sentDate = Date()
        id = nil
    }
    
}

extension Message: MessageType {
    var messageId: String{
        return UUID().uuidString
    }
    
    var sender: SenderType {
      return Sender(id: member.name, displayName: member.name)
    }

//    var sentDate: Date {
//        return Date()
//    }

    var kind: MessageKind {
        return .text(text)
    }
    
}

extension Message: Equatable{
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.messageId == rhs.messageId
    }
}
