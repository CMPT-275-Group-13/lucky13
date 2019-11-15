//
//  ViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width/2
        //Listen for Keyboard Events
        
    }
    




}


