//
//  ViewController.swift
//  Facts
//
//  Created by Soya Diaoune on 2/17/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    

    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var logo: UILabel!
    
    @IBAction func signInAction(_ sender: UIButton) {

        
        FIRAuth.auth()?.signIn(withEmail: self.username.text!, password: self.password.text!, completion: { (user, error) in
            if user != nil{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainMenuController = storyboard.instantiateViewController(withIdentifier: "mainId")
                self.present(mainMenuController, animated: true, completion: nil)
            }else{
                //create alert for not being able to sign in
                let alert = UIAlertController(title: "Ooops", message: "Unable to sign you in. Make sure you provided the right credentials or try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })

    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //colors
        let bgColor = UIColor(red:0.00, green:0.21, blue:0.40, alpha:1.0)
        let buttonColor = UIColor(red:0.84, green:0.15, blue:0.52, alpha:1.0)
        self.view.backgroundColor = bgColor
        
        
        //edit signIn button
        signInButton.backgroundColor = buttonColor
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 20
        
        //edit sign up button
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        
        //change time color
        UIApplication.shared.statusBarStyle = .lightContent
        
        //edit username and textfield appearance
        username.backgroundColor = UIColor(red:0.65, green:0.66, blue:0.67, alpha:0.2)
        username.clipsToBounds = true
        username.layer.cornerRadius = 20
        
        password.clipsToBounds = true
        password.layer.cornerRadius = 20
        
        password.backgroundColor = UIColor(red:0.65, green:0.66, blue:0.67, alpha:0.2)
        
        //edit logo appearance
        logo.textColor = .white
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        
        //open menu for signed in individual
        let handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            // ...
        }
        
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            print("\nUser is signed in\n")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainMenuController = storyboard.instantiateViewController(withIdentifier: "mainId")
            present(mainMenuController, animated: true, completion: nil)
        } else {
            // No user is signed in.
            print("\nUser is not signed in\n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //remove keyboard when touches began outside text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for textField in self.view.subviews where textField is UITextField{
            textField.resignFirstResponder()
        }
    }


}

