//
//  SwitchViewController.swift
//  ScoutingApp
//
//  Created by Jeremy Evers on 1/27/18.
//  Copyright © 2018 Jeremy Evers. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    @IBOutlet weak var teleopUIView: UIView!
    @IBOutlet weak var AutoUIView: UIView!
    @IBOutlet weak var endGameUIView: UIView!
    @IBOutlet weak var foulsUIView: UIView!
    @IBOutlet weak var scoreUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AutoUIView.isHidden = false
        teleopUIView.isHidden = true
        endGameUIView.isHidden = true
        foulsUIView.isHidden = true
        scoreUIView.isHidden = true
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SceneSwitcher(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            AutoUIView.isHidden = false
            teleopUIView.isHidden = true
            endGameUIView.isHidden = true
            foulsUIView.isHidden = true
            scoreUIView.isHidden = true
        } else if sender.selectedSegmentIndex == 1 {
            AutoUIView.isHidden = true
            teleopUIView.isHidden = false
            endGameUIView.isHidden = true
            foulsUIView.isHidden = true
            scoreUIView.isHidden = true
        } else if sender.selectedSegmentIndex == 2 {
            AutoUIView.isHidden = true
            teleopUIView.isHidden = true
            endGameUIView.isHidden = false
            foulsUIView.isHidden = true
            scoreUIView.isHidden = true
        } else if sender.selectedSegmentIndex == 3 {
            AutoUIView.isHidden = true
            teleopUIView.isHidden = true
            endGameUIView.isHidden = true
            foulsUIView.isHidden = false
            scoreUIView.isHidden = true
        } else {
            AutoUIView.isHidden = true
            teleopUIView.isHidden = true
            endGameUIView.isHidden = true
            foulsUIView.isHidden = true
            scoreUIView.isHidden = false
        }
    }
}
