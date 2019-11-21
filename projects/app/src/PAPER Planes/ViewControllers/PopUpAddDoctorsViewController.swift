//
//  PopUpAddDoctorsViewController.swift
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-17.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase

struct Doctor{
    var FirstName: String
    var LastName: String
    var Email: String
}

class PopUpAddDoctorsViewController: UIViewController {
        
    @IBOutlet weak var FirstNameTxtField: UITextField!
    @IBOutlet weak var LastNameTxtField: UITextField!
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    
    var docRef: DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
