//
//  Channel.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-11-24.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

//struct  Channel {
//    let DoctorName: String
//
//    init(DoctorName: [String: Any]){
//        self.DoctorName = DoctorName
//    }
//    init?(document:DocumentSnapshot){
//
//        let data = document["doctor"]
//
//
//        let DoctorName = data as! String
//
////        guard let DoctorName = document["doctor"] as? String else {
////            print("error4")
////            return nil
////        }
//        self.DoctorName = DoctorName
//        print(DoctorName)
//    }
//}

struct Channel {
  var DoctorName: String
  
    init?(document: QueryDocumentSnapshot) {
      let data = document.data()
      
      guard let name = data["name"] as? String else {
        return nil
      }
      
//      id = document.documentID
      self.DoctorName = name
    }
    
  }


//extension Channel: DatabaseRepresentation {
//
//  var representation: [String : Any] {
//    var rep = ["doctor": DoctorName]
//    return rep
//  }
//
//}

extension Channel: Comparable {
  
  static func == (lhs: Channel, rhs: Channel) -> Bool {
    return false
  }
  
  static func < (lhs: Channel, rhs: Channel) -> Bool {
    return false
  }
  
  
  //class Channel{
  //    private var _Doctor: String!
  //
  //    var Doctor:String!{
  //        return _Doctor
  //    }
  //
  //    init(Doctor:String) {
  //        self._Doctor = Doctor
  //    }
  //
  //    init?(DoctorData: DocumentSnapshot){
  ////        if let Doctor = DoctorData["doctor"] as? String{
  ////            self._Doctor = Doctor
  ////        }
  //        let data = documents.data()
  //        guard let name = data["doctor"] as? String else{
  //            return nil
  //        }
  //    }
  //}
  
}

