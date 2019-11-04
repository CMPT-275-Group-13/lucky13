//
//  MyDoctorsViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class MyDoctorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton.init(type: .roundedRect)
        button.setTitle("Doctor1", for: . normal)
        self.view.addSubview(button)
        
        
    }
    
    @objc func buttonClicked(sender: UIButton){
        print("Doctor 1 has been selected")
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
