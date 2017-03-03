//
//  BrowserViewController.swift
//  Facts
//
//  Created by Soya Diaoune on 2/18/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
//import stuff so web can work
import WebKit

class BrowserViewController: UIViewController {
    
    
    @IBOutlet var browserView: UIWebView!
    
    @IBOutlet var factsLabel: UILabel!
    
    @IBOutlet var dismissBtn: UIButton!

    @IBAction func closeActn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var receivedURL = ""
    var htmlToString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let bgColor = UIColor(red:0.00, green:0.21, blue:0.40, alpha:1.0)
        let secondColor = UIColor(red:0.84, green:0.15, blue:0.52, alpha:1.0)
        self.view.backgroundColor = bgColor
        // Do any additional setup after loading the view.
        
        //create demo website
        let path = Bundle.main.path(forResource: "demoWebsite", ofType: "html")
        let demoUrl = URL(fileURLWithPath: path!)
        
        let realUrl = URL(string: "http://\(receivedURL)/")!
        
        browserView.loadRequest(URLRequest(url: realUrl))
        
        //edit facts appearance
        factsLabel.textColor = .white
        
        //edit dismiss btn
        dismissBtn.setTitleColor(.white, for: .normal)
        
        
        //custom buttons
        dismissBtn.clipsToBounds = true
        
        dismissBtn.layer.cornerRadius = 10
        dismissBtn.backgroundColor = secondColor
        dismissBtn.setTitleColor(.white, for: .normal)
        
        addCustomMenu()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            let annotationVC = segue.destination as! NewAnnotationViewController
            annotationVC.incomingAnnotation = browserView.stringByEvaluatingJavaScript(from: "window.getSelection().toString()")!
        }
    }
    
    func addCustomMenu(){
        let annotation = UIMenuItem(title: "New Annotation", action: #selector(BrowserViewController.newAnnotationPressed))
        UIMenuController.shared.menuItems = [annotation]
    }
    
    func newAnnotationPressed(){
        let newSelection = browserView.stringByEvaluatingJavaScript(from: "window.getSelection().toString()")! as String
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nextController = storyboard.instantiateViewController(withIdentifier: "annotateId") as! NewAnnotationViewController
        nextController.incomingAnnotation = newSelection
        nextController.incomingURL = (browserView.request?.url?.absoluteString)!
        present(nextController, animated: true, completion: nil)
        
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
