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
    
  let currentUser = localUserEmail
  private let ChannelCellID = "DoctorCell" //Identifying the cells
  private let db = Firestore.firestore()
  private var ChannelReference: DocumentReference{
    return db.collection("patient").document(currentUser)
  }
  var DoctorNameArray = [String]() //array for the doctor names
  var DoctorEmailArray = [String]() //array for the doctor emails
  private var channelListener: ListenerRegistration?
  deinit {
    channelListener?.remove()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myTableView.dataSource = self
    myTableView.delegate = self

    
// Taking a snpashot of the of the data from firebase
   channelListener = ChannelReference.addSnapshotListener { querySnapshot, error in
// Make sure that the snapshot is returning something other than nil
    guard let snapshot = querySnapshot else {
      print("Error listening for channel updates: \(error?.localizedDescription ?? "No error")")
      return
    }
    let data = snapshot.get("doctor") as! NSArray
    let dataArray = (data as! [String])
    self.DoctorNameArray = []
    self.DoctorEmailArray = dataArray
    let dispatch = DispatchGroup()
// looping through each element of the array to get data from a different collection
    for dataarray in dataArray {
        self.GetDoctorName(dispatch: dispatch, Name: dataarray){
            (name) in dispatch.notify(queue: .main, execute: {
                self.DoctorNameArray.append(name) //Store the data
                self.myTableView.reloadData() //reloading the tableview
                })
            }
        }
    }
  }

    // uses the email we collected from the database to find the full names of the doctors
    // dispatchgroup prevents asynchronious issues due to Firebase query time
    private func GetDoctorName(dispatch: DispatchGroup, Name: String, Completed: @escaping (String) -> Void) {
        var fullName: String = ""
        var NameReference : DocumentReference{
            return db.collection("doctors").document(Name)
        }
        
        dispatch.enter()
        //gets the data from firebase
        NameReference.getDocument { (document, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let document = document, document.exists{

                    let firstName = document.get("firstName") as! String
                    let lastName = document.get("lastName") as! String
                    //combines first and last name into one string
                    fullName = firstName + " " + lastName
                }
                else
                {
                    print("Document does not exist")
                }
            }
            dispatch.leave()
        }
        
        dispatch.notify(queue: .main, execute: {
        Completed(fullName) //returns fullName once dispatch group is finished
        })
    }
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctorNameArray.count //returns the number of elements in the array
    }
  
    //Populates cells with doctor names
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath)
    cell.textLabel!.text = DoctorNameArray[indexPath.row] //changes the text for each cell
    return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        localDoctorEmail = self.DoctorEmailArray[indexPath.row]//Sets the localDoctorEmail to the selected doctor's email
        localDoctorName = self.DoctorNameArray[indexPath.row] //Sets the localDoctorName to the selected doctor
    }
  
}




