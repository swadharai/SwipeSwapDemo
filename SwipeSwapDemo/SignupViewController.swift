//
//  SignupViewController.swift
//  SwipeSwapDemo
//
//  Created by Swadha Rai on 10/12/19.
//  Copyright © 2019 Swipers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func nextPress(_ sender: Any) {
        
        let rootRef = Database.database().reference()
        let ref = rootRef.child("List User")
        
        if nameField.text != "" {
            ref.child("List User").childByAutoId().setValue(nameField.text) // primary key
//                    nameField.text = ""
        }
        let userChild = ref.child(nameField.text!)
        
        let dictUser: [String: String] = ["description": "Helping Heel", "price": "$0", "status": "I have 2 swipes to give away at Lenoir!"]
        
        userChild.setValue(dictUser)
        
//
//        if nameField.text != "" {
//            ref?.child("users").childByAutoId().setValue(nameField.text) // primary key
//            // nameField.text = ""
//
//
//        }
//
        
        
        
        
        // CHECK IF WE CAN REDO OUR NULL CHECKS
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
    
    class user {
        
        var name: String!
        var key: String
        
        init(from snapshot: DataSnapshot) {
            
            let snapshotValue = snapshot.value as! [String: Any]
            
            self.name = snapshotValue["name"] as? String
            self.key = snapshot.key
        }
    }
    
   // @IBAction func nextPress( sender: Any) {
//
//        ref = Database.database().reference()
//
//        if nameField.text != "" {
//            ref?.child("list").childByAutoId().setValue(nameField.text) // primary key
//               // nameField.text = ""
//
//        }
//
//        // CHECK IF WE CAN REDO OUR NULL CHECKS
////        guard
////            nameField.text != "",
////            emailField.text != "",
////            passwordField.text != "",
////            confirmPasswordField.text != ""
////            else {
////                return;
////            }
//
//        if passwordField.text == confirmPasswordField.text {
//            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in // removed "optional chaining" question mark that was in tutorial vid
//
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//
//                // check that user isn't null
//                if let u = user {
//                    // going to home screen
//                    //let price = user?.additionalUserInfo;
//                    self.performSegue(withIdentifier: "goToHome", sender: self) // these might not be defined yet
//                } else {
//                    // error: check error and show message
//                }
//
//            })
//
//        } else {
//            print("Password does not match")
//        }
    
 //   }
}
