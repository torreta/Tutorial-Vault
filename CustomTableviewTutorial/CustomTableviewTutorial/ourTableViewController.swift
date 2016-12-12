//
//  ourTableViewController.swift
//  CustomTableviewTutorial
//
//  Created by Mac Mini1 on 11/19/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ourTableViewController: UITableViewController {

    let paragraphOne = "still local, vars....If you can keep your head when all about you \n Are losing theirs and blaming it on you, \n If you can trust yourself when all men doubt you, \n But make allowance for their doubting too, \n If you can wait and not be tired by waiting, \n Or being lied about, don’t deal in lies, \n Or being hated, don’t give way to hating, \n And yet don’t look too good, nor talk too wise: "
    let paragraphTwo = "If you can dream—and not make dreams your master; \n If you can think—and not make thoughts your aim; \n If you can meet with Triumph and Disaster \n And treat those two impostors just the same; \n If you can bear to hear the truth you've spoken \n Twisted by knaves to make a trap for fools, \n Or watch the things you gave your life to, broken, \n And stoop and build ’em up with worn-out tools"
    let paragraphThree = "If you can make one heap of all your winnings \n And risk it on one turn of pitch-and-toss, \n And lose, and start again at your beginnings \n And never breathe a word about your loss; \n If you can force your heart and nerve and sinew \n To serve your turn long after they are gone, \n And so hold on when there is nothing in you \n Except the Will which says to them: \"Hold On!\""
    let paragraphFour = "If you can talk with crowds and keep your virtue, \n Or walk with Kings—nor lose the common touch, \n If neither foes nor loving friends can hurt you, \n If all men count with you, but none too much; \n If you can fill the unforgiving minute \n With sixty seconds’ worth of distance run, \n Yours is the Earth and everything that’s in it, \n And—which is more—you’ll be a Man, my son."
    
    var poem: [String] { return [paragraphOne, paragraphTwo, paragraphThree, paragraphFour] }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

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
        return poem.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ourCell", forIndexPath: indexPath) as! ourTableViewCell
        
        cell.ourCellLabel.text = poem[indexPath.section]
        
        
        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerTitle = ""
        
        switch section {
        case 0: headerTitle = "Paragraph One"
        case 1: headerTitle = "Paragraph Two"
        case 2: headerTitle = "Paragraph Three"
        case 3: headerTitle = "Paragraph Four"
        default: break
        }
        return headerTitle
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
