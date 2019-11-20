//
//  PopUpAddDoctorTableViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-11-15.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase

struct NewDoctor{
    var FirstName: String
    var LastName: String
    var Email:String
}


class PopUpAddDoctorTableViewController: UITableViewController {

    @IBOutlet weak var Firstname: UITextField!
    @IBOutlet weak var Lastname: UITextField!
    @IBOutlet weak var Emailentry: UITextField!
    @IBOutlet weak var Save: UIButton!
    
//    var messageArr = [Message]()
    var db:Firestore!
    var currentuser: String = "Akan"
    
    var docRef: DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        docRef = db.collection("patient").document(currentuser)
    }

//    @IBAction func addDoctor(sender: UIButton){
//    print ("sent new doctor")
//    guard let Firstnamebody = Firstname,!Firstnamebody.isEmpty else{return}
//    guard let Lastnamebody = Lastname,!Lastnamebody.isEmpty else{return}
//    guard let Emailbody = Emailentry,!Emailbody.isEmpty else{return}
//    sendMessage(FirstName: Firstnamebody, LastName: Lastnamebody, Email: Emailbody)
//
//    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

//    private func sendMessage(body: String, from: Bool){
//    //var ref: DocumentReference? = nil
//    let dataToSave: [String: Any] = ["FirstName": FirstName, "LastName": LastName, "Email": Email]
//    docRef.addCollection(data: dataToSave){err in
//    if let err = err {
//    print("Error adding document: \(err)")
//    } else {
//    print("Document added with ID:")
//    }
//
//
//
//
//    }
//    //        ref = colRef.addDocument(data: [
//    //            "Body": body, "From": from]) { err in
//    //            if let err = err {
//    //                print("Error adding document: \(err)")
//    //            } else {
//    //                print("Document added with ID: \(ref!.documentID)")
//    //            }
//    //        }
//
//    }
    
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
