//
//  MessagingViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
//import Firebase

struct Message{
    var user: String
    var body: String
}


class MessagingViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var msgTxtField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var sendButton: UIButton!
//    @IBOutlet weak var tableView: UITableView!
    
    var messageArr = [Message]()
    
    var db: Firestore!
    var currentuser : String = "csmith"
    var currentdoctor : String = "John_Doe"
    
    var colRef: CollectionReference!

    @IBAction func sendMsg(sender: UIButton){
        print("BUTT")
        guard let msgBody = msgTxtField.text, !msgBody.isEmpty else{return}
        sendMessage(body: msgBody, from: true)
    }
    
    @IBAction func getMsg(sender: UIButton){
        print("RECEIVE")
        getMessages()
    }

    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        colRef.addSnapshotListener{ (docSnapShot, error)in
//            guard let docSnapShot = docSnapShot, docSnapShot.isEmpty else {return}
//            let myData = docSnapShot
//        }
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings

        db = Firestore.firestore()
        
        colRef = db.collection("messages").document(currentuser).collection(currentdoctor)
        
    }
        // Set textfield delegate
//        msgTxtField.delegate = self
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object:nil )
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    

//    func textFieldShouldReturn(_ MsgTxtField: UITextField) -> Bool {
//        print("RELEASED")
//        self.view.endEditing(true)
//        return true
//    }

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        view.endEditing(true)
//    }
//
//    // MARK: Actions
//    @IBAction func MsgTxtField(_ sender: Any) {
//
//    }
//    func hideKeyboard(){
//        MsgTxtField.resignFirstResponder()
//    }
    
//    deinit {
         //Stop listening to keyboard hide/show events
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
//    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        print("AYYY")
//        getMessages()
//
//        print(self.scrollView.frame.size.height, self.scrollView.contentSize.height)
//
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            let keyboardHeight = keyboardSize.height
//            self.scrollView.frame.size.height-=keyboardHeight
//            self.scrollView.contentSize.height-=keyboardHeight
//        }
//
//       self.scrollView.frame.size.height-=500
//
//        print(self.scrollView.frame.size.height, self.scrollView.contentSize.height)
//
//    }

//    @objc func keyboardWillHide(notification: NSNotification) {
//            print("NOOOO")
//
//            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//
//                        let keyboardHeight = keyboardSize.height
//                        self.scrollView.frame.size.height+=keyboardHeight
//            //            self.scrollView.contentSize.height-=keyboardHeight
//                    }
//
//            self.scrollView.frame.size.height+=keyboardHeight
//
//    }
    
//    @objc func keyboardWillChange(notification: Notification){
//        print("Keyboard will show:\(notification.name.rawValue) ")
//
//        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//        }
//
//        if (notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification){
//
//            scrollView.size.height -= keyboardRect;
//            if (!self.scrollView.bounds.contains(MsgTxtField.frame.origin)) {
//            self.scrollView.scrollRectToVisible(MsgTxtField.frame, animated: true)
//            }
//        }
//        else {
//            scrollView.frame.origin.y = 0
//        }
//    }
    
    private func sendMessage(body: String, from: Bool){
        //var ref: DocumentReference? = nil
        let dataToSave: [String: Any] = ["Body": body, "From": from]
        colRef.addDocument(data: dataToSave){err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID:")
            }
            
        }
//        ref = colRef.addDocument(data: [
//            "Body": body, "From": from]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }

    }
    
    private func getMessages()
    {
        
    }
    
}

