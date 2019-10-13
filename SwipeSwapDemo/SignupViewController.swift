//
//  SignupViewController.swift
//  SwipeSwapDemo
//
//  Created by Swadha Rai on 10/12/19.
//  Copyright © 2019 Swipers. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPress(_ sender: Any) {
//        guard
//            nameField.text != "",
//            emailField.text != "",
//            passwordField.text != "",
//            confirmPasswordField.text != ""
//            else {
//                return;
//            }
        
        if passwordField.text == confirmPasswordField.text {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in // removed "optional chaining" question mark that was in tutorial vid
                
                if let error = error {
                    print(error.localizedDescription)
                }
                
                // check that user isn't null
                if let u = user {
                    // going to home screen
                    //let price = user?.additionalUserInfo;
                    self.performSegue(withIdentifier: "goToHome", sender: self) // these might not be defined yet
                } else {
                    // error: check error and show message
                }
                
            })
            
        } else {
            print("Password does not match")
        }
    
    }
}
