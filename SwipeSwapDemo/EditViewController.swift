//
//  EditViewController.swift
//  SwipeSwapDemo
//
//  Created by Swadha Rai on 10/13/19.
//  Copyright © 2019 Swipers. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class EditViewController: UIViewController {
    
    // IB outlets
    @IBOutlet weak var SaveChanges: UIButton!
    @IBOutlet weak var StatusField: UITextField!
    @IBOutlet weak var PriceField: UITextField!
    @IBOutlet weak var DescriptionField: UITextField!
    
    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveChangesAction(_ sender: Any) {
        
        var user = FirebaseApp.auth().currentUser;

        let rootRef = Database.database().reference()
        let ref = rootRef.child("List User")
        guard let key = ref.child("List User").childByAutoId().key else{return}
//        let user =
//            ["description": DescriptionField.text!,
//             "price": PriceField.text!,
//             "status": StatusField.text!]
        
        
        guard let uid = user.uid else {
            return
        }
        
        let descript = ["description": DescriptionField.text!]
        let price = ["price": PriceField.text!]
        let status = ["status": StatusField.text!]
        
        let ref = Database.database().reference().root.child("List User").child(uid).updateChildValues(["description": descript],["price": price])
        
        
    }
}
