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

struct Medication{
    var docName : String
    var amount : String
    var medName : String
    var time : String
    
    init(docFirst : String, docLast: String, amount: String, medName: String, time: Int){
        self.docName = docFirst + " " + docLast
        self.amount = amount
        self.medName = medName
    

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let tempDate = dateFormatter.date(from: String(time))
        
        dateFormatter.dateFormat = "hh:mm a"
        self.time = dateFormatter.string(from: tempDate as! Date)
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
        
        MedReference.getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.MedArray.append(Medication(docFirst: document.data()["docFirstName"] as! String, docLast: document.data()["docLastName"] as! String, amount: document.data()["amount"] as! String, medName: document.data()["name"] as! String, time: document.data()["time"] as! Int))
                }
                self.medTableView.reloadData()
            }
        }
    }
    

    // MARK: - Table view data source
  
    override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //print(DoctorNameArray.count)
    return MedArray.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath) as! MedicationTableViewCell
      let Medication = MedArray[indexPath.row]
      cell.medNameLabel?.text = Medication.medName
      cell.docNameLabel?.text = Medication.docName
      cell.timeLabel?.text = Medication.time
      cell.amountLabel?.text = Medication.amount

      return cell
    }
      
    
}





