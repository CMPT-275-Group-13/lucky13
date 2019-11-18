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
  let name: String
  let color: UIColor
}

struct Message {
  let member: Member
  let text: String
  let messageId: String
}

extension Message: MessageType {
  var sender: SenderType {
    return Sender(id: member.name, displayName: member.name)
  }
  
  var sentDate: Date {
    return Date()
  }
  
  var kind: MessageKind {
    return .text(text)
  }
}

