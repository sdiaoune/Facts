//
//  AnnotationThreadTableViewController.swift
//  Facts
//
//  Created by Soya Diaoune on 2/19/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class AnnotationThreadTableViewController: UITableViewController {

    var ref: FIRDatabaseReference!
    var annotationArray: [String] = []
    var keyArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        ref = FIRDatabase.database().reference()
        
        ref.child("uploads").queryOrdered(byChild: "annotation").observe(.childAdded, with: { (snapshot) -> Void in
            let value = snapshot.value as? NSDictionary
            if let annotation = value?["annotation"] as? String {
                print(annotation)
                self.annotationArray.append(annotation)
                self.keyArray.append(snapshot.key)
                self.tableView.reloadData()
                
            }else{
                print("\n\ncould not find anything\n\n")
            }
        })
        
        
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(AnnotationThreadTableViewController.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = rc
        
    }

    func refresh(refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return annotationArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as! StatusTableViewCell
        cell.label.text = annotationArray[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nextController = storyboard.instantiateViewController(withIdentifier: "displayId") as! AnnotationOverviewViewController
        nextController.incomingKey = keyArray[indexPath.row]
        present(nextController, animated: true, completion: nil)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
