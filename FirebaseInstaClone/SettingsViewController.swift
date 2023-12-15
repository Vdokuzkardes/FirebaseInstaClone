//
//  SettingsViewController.swift
//  FirebaseInstaClone
//
//  Created by Vedat Dokuzkardeş on 17.11.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    
    @IBAction func outBtn(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print("error")
        }
        
    }
    
}
