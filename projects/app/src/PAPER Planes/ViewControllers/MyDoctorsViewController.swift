//
//  MyDoctorsViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Worked on by: Angus Kan, Marco Liang
//  Copyright © 2019 Angus Kan. All rights reserved.
//

 import UIKit

 class MyDoctorsViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var addDoc: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
     super.viewDidLoad()
     // Do any additional setup after loading the view.
     
     FirstName.delegate = self
     LastName.delegate = self
     PhoneNumber.delegate = self
     NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object:nil )
     NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
     NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
     
     }
     @IBOutlet var NewDoctor: UIView!
     @IBAction func AddDoctorButton(_ sender: Any) {
         self.view.addSubview(NewDoctor)
         NewDoctor.center = self.view.center
     }
     @IBAction func Donebutton(_ sender: Any) {
         self.NewDoctor.removeFromSuperview()
         hideKeyboard()
     }
     func textFieldDidBeginEditing(_ textField: UITextField) {
         self.FirstName = textField
         self.LastName = textField
         self.PhoneNumber = textField
     }
     func hideKeyboard(){
         FirstName.resignFirstResponder()
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
         
         if (notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification) && self.FirstName.frame.origin.y > keyboardRect.height  {
             view.frame.origin.y = -keyboardRect.height
         }
         else {
             view.frame.origin.y = 0
         }
         
    
     }
 }
