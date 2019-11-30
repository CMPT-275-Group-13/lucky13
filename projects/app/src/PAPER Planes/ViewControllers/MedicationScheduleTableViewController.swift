//
//  MedicationScheduleTableViewController.swift
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-29.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

//structure for the fields in the document of medication
struct Medication{
    var docName : String
    var amount : String
    var medName : String
    var time : String
//initializer for the data we get from firebase
    init(docFirst : String, docLast: String, amount: String, medName: String, time: Int){
        self.docName = docFirst + " " + docLast
        self.amount = amount
        self.medName = medName
        //For converting our int into a time in 24hr format
        //Then converting to 12hr format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let tempDate = dateFormatter.date(from: String(time))
        dateFormatter.dateFormat = "hh:mm a"
        self.time = dateFormatter.string(from: tempDate!)
    }
}

class MedicationTableViewCell: UITableViewCell{
    @IBOutlet weak var medNameLabel: UILabel!
    @IBOutlet weak var docNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
}

class MedicationScheduleTableViewController: UITableViewController {

    @IBOutlet var medTableView: UITableView!
   
    let currentUser = localUserEmail
    private let MedCellID = "MedicationCell"
    private let db = Firestore.firestore()
    private var MedReference: CollectionReference{
        return db.collection("medication").document(currentUser).collection("dailyMedications")
    }
    private var MedArray = [Medication]()

    override func viewDidLoad() {
        super.viewDidLoad()
        medTableView.dataSource = self
        medTableView.delegate = self
        medTableView.allowsSelection = false //disables pressing on the medications
        
        //retrieve data from firebase, initialize the data, then reload the table view so it shows up
        MedReference.getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    //Append the retrieved data into an array
                    self.MedArray.append(Medication(docFirst: document.data()["docFirstName"] as! String, docLast: document.data()["docLastName"] as! String, amount: document.data()["amount"] as! String, medName: document.data()["name"] as! String, time: document.data()["time"] as! Int))
                }
                self.medTableView.reloadData()
            }
        }
    }
    

    // MARK: - Table view data source
    // Defines only one section in tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    // Defines rows to be the length of the Medication Array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MedArray.count
    }
    
    // Populates cell labels with data from Medication
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath) as! MedicationTableViewCell
      let Medication = MedArray[indexPath.row]
      //changes the UILabels to the data we retrieve from firebase
      cell.medNameLabel?.text = Medication.medName
      cell.docNameLabel?.text = Medication.docName
      cell.timeLabel?.text = Medication.time
      cell.amountLabel?.text = Medication.amount

      return cell
    }
      
    
}





