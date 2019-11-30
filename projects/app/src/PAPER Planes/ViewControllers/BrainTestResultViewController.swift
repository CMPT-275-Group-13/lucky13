//
//  BrainTestResultViewController.swift
//  PAPER Planes
//
//  Created by Minh Dinh on 2019-11-03.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class BrainTestResultViewController: UIViewController {

    var resultText = "Test\nNewline\nSomething"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextLabel.text = resultText
        // Do any additional setup after loading the view.
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
    
    @IBOutlet weak var resultTextLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
