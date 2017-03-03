//
//  BrowseViewController.swift
//  Facts
//
//  Created by Soya Diaoune on 2/18/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var urlTextField: UITextField!
    
    @IBOutlet var signInBtn: UIButton!
    
    @IBAction func signInBtnAction(_ sender: UIButton) {
        urlTextField.text = ""
    }
    
    @IBOutlet var factsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //change time color
        UIApplication.shared.statusBarStyle = .lightContent
        
        let bgColor = UIColor(red:0.00, green:0.21, blue:0.40, alpha:1.0)
        let buttonColor = UIColor(red:0.84, green:0.15, blue:0.52, alpha:1.0)
        let transparentWhite = UIColor(red:0.65, green:0.66, blue:0.67, alpha:0.2)
        self.view.backgroundColor = bgColor
        
        //edit appearance for sign in button
        signInBtn.clipsToBounds = true
        signInBtn.layer.cornerRadius = 20
        signInBtn.backgroundColor = buttonColor
        signInBtn.setTitleColor(.white, for: .normal)
        
        urlTextField.clipsToBounds = true
        urlTextField.layer.cornerRadius = 20
        urlTextField.backgroundColor = transparentWhite
        
        //change facts label appearance
        factsLabel.textColor = .white
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchToBrowser" {
            let browserVC = segue.destination as! BrowserViewController
            browserVC.receivedURL = urlTextField.text!
        }
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
