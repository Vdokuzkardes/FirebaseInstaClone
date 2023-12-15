//
//  ViewController.swift
//  FirebaseInstaClone
//
//  Created by Vedat Dokuzkardeş on 16.11.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func signInBtn(_ sender: Any){
        
        if emailTxt.text != "" && PasswordTxt.text != "" {
            
            Auth.auth().signIn(withEmail: emailTxt.text!, password: PasswordTxt.text!) {  (authdata, error) in
                if error != nil {
                    
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(titleInput: "Error", messageInput: "Username/Password ?")
        }
        
        
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        if emailTxt.text != "" && PasswordTxt.text != "" {
            
            Auth.auth().createUser(withEmail: emailTxt.text!, password: PasswordTxt.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                    
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else{
         makeAlert(titleInput: "Error", messageInput: "Usarname/Password ?")
        }
        
        
        
    }
    
    func makeAlert(titleInput:String, messageInput:String ) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    

}

