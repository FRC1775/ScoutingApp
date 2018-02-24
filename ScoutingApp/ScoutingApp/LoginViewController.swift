//
//  LoginViewController.swift
//  ScoutingApp
//
//  Created by Jeremy Evers on 1/27/18.
//  Copyright © 2018 Jeremy Evers. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
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
    
    @IBAction func loginClicked(_ sender: UIButton) {
        //check if either fields are empty
        if isFieldEmpty(email: emailText, password: passwordText) {
            return
        }
        //check if email is valid
        if !isValidEmail(email: self.emailText.text!) {
            return
        }
        //attempt to validate with database
        var request = URLRequest(url: URL(string: "http://IP location/login.php")!)
        request.httpMethod = "POST"
        let postString = "email=" + emailText.text! + "&password=" + passwordText.text!
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error ?? "An unknown error occured.")
            }
            else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    
                    if let successful = parsedData["loginsuccessful"] as? Bool {
                        //LOGIN FAILED/INVALID CREDENTIALS (DISPLAY AN ERROR)
                        if (successful == false) {
                            //TODO add error message
                        }
                        else {
                            if let user = parsedData["user"] as? [String: Any] {
                                
                                let defaults = UserDefaults.standard
                                //SAVE USER INFO TO DEVICE
                                //Retrieve using defaults.object(forKey:"firstname")
                                if let firstname = user["firstname"] as? String {
                                    defaults.set(firstname, forKey: "firstname")
                                }
                                if let mname = user["mname"] as? String {
                                    defaults.set(mname, forKey: "mname")
                                }
                                if let lname = user["lname"] as? String {
                                    defaults.set(lname, forKey: "lname")
                                }
                                
                                defaults.set(true, forKey: "loggedIn")
                            }
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        checkIfLoggedIn()
        task.resume()
    }
    
    func checkIfLoggedIn() {
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey:"loggedIn") == true) {
            performSegue(withIdentifier: "loginComplete", sender: nil)
        }
    }
}

func isFieldEmpty(email:UITextField, password:UITextField) -> Bool {
    if email.text!.isEmpty || password.text!.isEmpty {
        return true
    }
    
    return false
}

func isValidEmail(email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
