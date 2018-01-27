//
//  AutonomousViewController.swift
//  ScoutingApp
//
//  Created by Jeremy Evers on 1/27/18.
//  Copyright © 2018 Jeremy Evers. All rights reserved.
//

import UIKit

class AutonomousViewController: UIViewController {

    @IBOutlet weak var passedLineSwitch: UISwitch!
    @IBOutlet weak var cubeInSwitchSwitch: UISwitch!
    @IBOutlet weak var cubeInScaleSwitch: UISwitch!
    @IBOutlet weak var pickUpCubeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}