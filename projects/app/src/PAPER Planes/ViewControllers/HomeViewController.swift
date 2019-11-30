//
//  HomeViewController.swift
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-21.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let db = Firestore.firestore()
        
        db.collection("patient").document(localUserEmail).getDocument{(document, error) in
            if let document = document, document.exists {
                let firstName = document.get("firstName") as! String
                let lastName = document.get("lastName") as! String
                localUserName = firstName + " " + lastName
                print(localUserName)
            } else {
                localUserName = "No patient profile found, contact your doctor"
            }
            
            self.nameLabel.text = localUserName
            
        
        }
        

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppUtility.lockOrientation(.all)
    }
    

}
