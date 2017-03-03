//
//  AnnotationOverviewViewController.swift
//  Facts
//
//  Created by Soya Diaoune on 2/19/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class AnnotationOverviewViewController: UIViewController {
    @IBOutlet var annotatedText: UILabel!
    @IBOutlet var response: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var url: UILabel!
    @IBOutlet var email: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var dismissBtn: UIButton!
    
    @IBAction func dismissBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    //database stuff (to access)
    var ref: FIRDatabaseReference!
    
    var incomingKey: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let bgColor = UIColor(red:0.00, green:0.21, blue:0.40, alpha:1.0)
        let buttonColor = UIColor(red:0.84, green:0.15, blue:0.52, alpha:1.0)
        self.view.backgroundColor = bgColor
        
        
        //edit dismiss button
        dismissBtn.clipsToBounds = true
        dismissBtn.layer.cornerRadius = 10
        dismissBtn.backgroundColor = buttonColor
        dismissBtn.setTitleColor(.white, for: .normal)
        
        //read data from database
        
        ref = FIRDatabase.database().reference()
        ref.child("uploads").child(incomingKey).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let annotation = value?["annotation"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            let comment = value?["summary"] as? String ?? ""
            let url = value?["url"] as? String ?? ""
            let date = value?["date"] as? String ?? ""
            
            self.annotatedText.text = annotation
            self.response.text = comment
            self.date.text = date
            self.url.text = url
            self.email.text = email
            
            self.annotatedText.textColor = .white
            self.annotatedText.lineBreakMode = .byWordWrapping
            self.annotatedText.numberOfLines = 0
            self.annotatedText.sizeToFit()
            
            self.response.textColor = .white
            self.response.lineBreakMode = .byWordWrapping
            self.response.numberOfLines = 0
            self.response.sizeToFit()
            
            self.date.textColor = .white
            self.url.textColor = .white
            self.email.textColor = .white
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        //modify text appearance
        
        //modify scroll view
        scrollView.contentSize.width = self.view.frame.width
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
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
