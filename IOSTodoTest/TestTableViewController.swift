//
//  TestTableViewController.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var arrayTest = [Test]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        arrayTest = appDelegate.arrayTest!
    
     
     
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayTest.count
    }

  
    @IBAction func menuButton(sender: UIBarButtonItem) {
        
        let menuTab = (tabBarController as! TabBarController).sidebar
        
        if menuTab.isCurrentlyOpen == false{
        
        menuTab.showInViewController(self, animated: true)
            
        }else{
            
         menuTab.dismissAnimated(true, completion: nil)
                 }
        
       // (tabBarController as! TabBarController).sidebar.showInViewController(self, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "TestTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TestTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let test = arrayTest[indexPath.row]
        
        //Conversion Int => String
        let duracion = Int(test.duracion)!
        let resta = Int(test.resta)!
        
        
        cell.nameLabel.text = test.nombre
        if duracion != 0 {
            
            let xNSNumber = duracion as NSNumber
            let xString : String = xNSNumber.stringValue + " min"
            cell.timeLabel.text = xString
        
        } else{
            
            cell.timeLabel.text = "Sin tiempo"
        }
        
        
        switch resta {
        case 0:
            cell.typeLabel.text = "los fallo no restan"
        case 1:
           cell.typeLabel.text = "1 fallo resta una respuesta correcta"
        case 2:
           cell.typeLabel.text = "2 fallos restan una respuesta correcta"
        case 3:
            cell.typeLabel.text = "3 fallo restan una respuesta correcta"
        default: // el switch debe cubrir todos los valores posibles
            print("otro")
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    @IBAction func endSesionButton(sender: UIBarButtonItem) {
        //Cerrar sesion!!!!!!!!!
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showQuestion" {
            let questionTableViewController = segue.destinationViewController as! QuestionTableViewController
            if let selectedTestCell = sender as? TestTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedTestCell)!
                let selectedTest = arrayTest[indexPath.row]
                questionTableViewController.test = selectedTest
                
               
                
               
              
                
                    
                
                
            }
        }
    }
    

}
