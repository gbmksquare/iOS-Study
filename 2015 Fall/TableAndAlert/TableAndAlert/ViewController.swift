//
//  ViewController.swift
//  TableAndAlert
//
//  Created by 구범모 on 2015. 9. 16..
//  Copyright (c) 2015년 gbmKSquare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        // Setup cell
        let section = indexPath.section
        let row = indexPath.row
        cell.textLabel?.text = "Cell Section \(section) Row \(row)"
        
        return cell
    }
    
    // MARK: Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Create alert
        let alertView = UIAlertView(title: "Alert", message: "You selected a cell!", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
        
        // Deselect cell
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: UIAlertView delegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        // Create alert
        let alertController = UIAlertController(title: "2nd Alert", message: "You selected button at index \(buttonIndex)", preferredStyle: .Alert)
        
        let sorryAction = UIAlertAction(title: "Sorry", style: .Destructive, handler: nil)
        alertController.addAction(sorryAction)
        
        let confirmAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(confirmAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

