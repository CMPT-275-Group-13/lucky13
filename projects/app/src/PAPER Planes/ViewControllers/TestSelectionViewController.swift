//
//  TestSelectionViewController.swift
//  PAPER Planes
//
//  Created by Minh Dinh on 2019-11-28.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class TestSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
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
