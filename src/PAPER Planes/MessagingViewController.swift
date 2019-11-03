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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
//    @IBOutlet weak var constraintContentHeight: NSLayoutConstraint!
    
    //var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set textfield delegate
        MsgTxtField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
              
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
              
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object:nil )
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    // MARK: UITextFieldDelegate
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        activeField = textField
//        lastOffset = self.scrollView.contentOffset
//        return true
//    }
//
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("RELEASED")
        hidekeyboard()
        return true
    }

    func hidekeyboard(){
        MsgTxtField.resignFirstResponder()
    }
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
    
    deinit {
         //Stop listening to keyboard hide/show events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("AYYY")
        print(self.scrollView.frame.size.height, self.scrollView.contentSize.height)
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            self.scrollView.frame.size.height-=keyboardHeight
//            self.scrollView.contentSize.height-=keyboardHeight
        }
        
//        self.scrollView.frame.size.height-=500

        print(self.scrollView.frame.size.height, self.scrollView.contentSize.height)

    }

    @objc func keyboardWillHide(notification: NSNotification) {
            print("NOOOO")
            
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                        let keyboardHeight = keyboardSize.height
                        self.scrollView.frame.size.height+=keyboardHeight
            //            self.scrollView.contentSize.height-=keyboardHeight
                    }
        
//            self.scrollView.frame.size.height+=keyboardHeight

    }
    
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
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
