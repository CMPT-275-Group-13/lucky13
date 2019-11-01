//
//  MessagingViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var MsgTxtField: UITextField!
    
    //var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
        // Handle the text field's  inputs through delegate callbacks
        MsgTxtField.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object:nil )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.MsgTxtField = textField
    }
    
    @IBAction func Send(_ sender: Any) {
        hideKeyboard()
    }
    //    // MARK: UITextFieldDelegate
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Hide the keyboard
//        textField.resignFirstResponder()
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        view.endEditing(true)
//    }
//
//    // MARK: Actions
//    @IBAction func MsgTxtField(_ sender: Any) {
//
//    }
    func hideKeyboard(){
        MsgTxtField.resignFirstResponder()
    }
    
    deinit {
         //Stop listening to keyboard hide/show events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
    }
    
    @objc func keyboardWillChange(notification: Notification){
        print("Keyboard will show:\(notification.name.rawValue) ")

        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        if (notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification) && self.MsgTxtField.frame.origin.y > keyboardRect.height  {
            view.frame.origin.y = -keyboardRect.height
        }
        else {
            view.frame.origin.y = 0
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
