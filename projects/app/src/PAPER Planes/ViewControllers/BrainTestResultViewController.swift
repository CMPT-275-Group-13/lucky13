//
//  BrainTestResultViewController.swift
//  PAPER Planes
//
//  Created by Minh Dinh on 2019-11-03.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class BrainTestResultViewController: UIViewController {
    @IBOutlet weak var resultTextLabel: UILabel!

    var resultText = "Test\nNewline\nSomething"

    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextLabel.text = resultText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.landscape)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.landscape)
    }
    
    @IBAction func returnToTest(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
