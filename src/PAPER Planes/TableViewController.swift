//
//  TableViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Worked on by: Angus Kan, Marco Liang
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

struct Channel {
    let name: String
    let id: String?
    
    init(name:String){
        id = nil
        self.name = name
    }
    init? (document:QueryDocumentSnapshot){
        let data = document.data()
        guard let name = data["doctor"] as? String else{
            return nil
        }
        id = document.documentID
        self.name = name
    }
}

extension Channel: Comparable{
    static func == (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.id == rhs.id
        }
        
        static func < (lhs: Channel, rhs: Channel) -> Bool {
          return lhs.name < rhs.name
        }
    }



class TableViewController: UITableViewController {

    private let toolbarLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont (ofSize: 15)
        return label
    }()
    
    private let channelCelIdentifier = "DoctorCell"
    private var currentChannelAlertController: UIAlertController?
    
    private let db = Firestore.firestore()
    
    private var channelreference: DocumentReference {
        return db.collection("patient").document("csmith")    }
    var currentUser: String = "csmith"
    private var channels = [Channel]()
    private var channelListener: ListenerRegistration?
    
    deinit{
        channelListener?.remove()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearsSelectionOnViewWillAppear = true
        
        toolbarItems = [
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (addButtonPressed)),
        ]
        
        
        
        channelListener = channelreference.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else{
                print ("error")
                return
            }
//            snapshot.documentChanges.forEach { change in
//            self.handleDocumentChange(change)
            }
        }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        navigationController?.isToolbarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        navigationController?.isToolbarHidden = true
    }

    @objc private func addButtonPressed(){
        print(channels)
        let ac = UIAlertController(title: "Create a new channel", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
        ac.addTextField { field in
            field.addTarget(self, action: #selector(self.textFieldDidChange (_field: )), for: .editingChanged)
            field.enablesReturnKeyAutomatically = true
            field.autocapitalizationType = .words
            field.clearButtonMode = .whileEditing
            field.placeholder = "Channel Name"
            field.returnKeyType = .done
        }
        let createAction = UIAlertAction(title: "Create", style: .default, handler: {_ in
            self.createChannel()
        })
        createAction.isEnabled = false
        ac.addAction(createAction)
        ac.preferredAction = createAction
        
        present(ac, animated:true) {
            ac.textFields?.first?.becomeFirstResponder()
        }
        currentChannelAlertController = ac
    }
    
    @objc private func textFieldDidChange (_field: UITextField){
//        guard let ac = currentChannelAlertController else{
//            return
//        }
        //ac.preferredAction?.isEnabled = field.hasText
    }

    private func createChannel(){
        guard let ac = currentChannelAlertController else{
            return
        }
        
        guard let channelName = ac.textFields?.first?.text else{
            return
        }
//        let channel = Channel(name: channelName)
//        channel
    }
    private func addChannelToTable(_ channel: Channel){
        guard !channels.contains(channel)else {
            return
        }
        channels.append(channel)
        channels.sort()
        guard let index = channels.index(of: channel) else{
            return
        }
        tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    private func updateChannelInTable(_ channel: Channel){
        guard let index = channels.index(of: channel) else {
            return
        }
        channels[index] = channel
        tableView.reloadRows(at:[IndexPath(row: index, section: 0)], with: .automatic)
    }
    private func removeChannelFromTable(_ channel: Channel){
        guard let index = channels.index(of: channel) else{
            return
        }
        channels.remove(at:index)
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    private func handelDocumentChange(_ change: DocumentChange){
        guard let channel = Channel(document: change.document) else{
            return
        }
        switch change.type{
        case .added:
            addChannelToTable(channel)
        case .modified:
            updateChannelInTable(channel)
        case .removed:
            removeChannelFromTable(channel)
        }
        
    }
}
    // MARK: - Table view data source
    extension TableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: channelCelIdentifier, for: indexPath)
        cell.textLabel?.text = channels[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


