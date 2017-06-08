//
//  TableViewController.swift
//  Swift_prova2
//
//  Created by Piero Silvestri on 27/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var nameArray = [String]();
    
    var nomiArray = ["Piero", "Giulio", "Franco", "Ugo"]
    var cognomiArray = ["Silvestri", "Forte", "Franchino", "Fantozzi"]

    
    var nameToBePassed = ""
    var surnameToBePassed = ""
    var indexToBePassed: Int?

    var didSelectRowFlag = false
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        nameToBePassed = nomiArray[indexPath.row]
        surnameToBePassed = cognomiArray[indexPath.row]
        indexToBePassed = indexPath.row
        didSelectRowFlag = true
        
        performSegue(withIdentifier: "detailSegue", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let detailVC = segue.destination as? ViewController
        
        detailVC!.namePassed = nameToBePassed
        detailVC!.surnamePassed = surnameToBePassed
        detailVC!.indexPassed = indexToBePassed

        didSelectRowFlag = false
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("IDENTIFIER")
        print(identifier)
        if(identifier == "cazzoDicane"){
            
            return true
        }else{
            
            return false
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return nomiArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CELL"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.textLabel?.text = nomiArray[indexPath.row]
        cell.detailTextLabel?.text = cognomiArray[indexPath.row]
        
        return cell
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
