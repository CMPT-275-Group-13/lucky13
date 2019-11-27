//
//  DoctorTableViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-11-24.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class DoctorTableViewController: UITableViewController {
  @IBOutlet weak var myTableView: UITableView!
//  @IBOutlet weak var refresh: UIBarButtonItem!
  
  let currentUser = localUserEmail
  private let ChannelCellID = "DoctorCell"
  private let db = Firestore.firestore()
  private var ChannelReference: DocumentReference{
    return db.collection("patient").document(currentUser)
  }
  private var ChannelArray = [Channel]()
  let hahaArray = ["Dog", "cat", "bird", "what" ]
  var DoctorNameArray = [String]()
  var DoctorEmailArray = [String]()
    private var NameListener: ListenerRegistration?
  private var channelListener: ListenerRegistration?
  deinit {
    channelListener?.remove()
    NameListener?.remove()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myTableView.dataSource = self
    myTableView.delegate = self
    
   channelListener = ChannelReference.addSnapshotListener { querySnapshot, error in

//      print("test2")
    guard let snapshot = querySnapshot else {
      print("Error listening for channel updates: \(error?.localizedDescription ?? "No error")")
      return
    }
    
    let data = snapshot.get("doctor") as! NSArray
//    var DoctorNameEntry: String = ""
//    var isDone: Boolean = false
    let dataArray = (data as Array).filter {$0 is String}
    self.DoctorNameArray = []
    for dataarray in dataArray {
        self.GetDoctorName(Name: dataarray as! String)
        self.DoctorEmailArray.append(dataarray as! String)
    }
    
    self.DoctorEmailArray.reverse()
    print(self.DoctorEmailArray)
    
    }
    
  }
    
  private func GetDoctorName(Name: String){
         var fullName: String = ""
         var NameReference : DocumentReference{
             return db.collection("doctors").document(Name)
         }
        NameReference.getDocument{ (document, error) in
            if let document = document, document.exists {
            let firstName = document.get("firstName") as! String
            let lastName = document.get("lastName") as! String
                
                fullName = firstName + " " + lastName
                self.DoctorNameArray.append(fullName)
            } else {
                print("Document does not exist")
            }
            self.myTableView.reloadData()
        }
    
//    print(self.DoctorNameArray)
    //print(fullName)
//    return fullName

    }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //print(DoctorNameArray.count)
    return DoctorNameArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath)
    cell.textLabel!.text = DoctorNameArray[indexPath.row]
    return cell
  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        localDoctorEmail = self.DoctorEmailArray[indexPath.row]
        localDoctorName = self.DoctorNameArray[indexPath.row]
    }
  
}




