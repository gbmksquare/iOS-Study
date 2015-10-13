//
//  ViewController.swift
//  TableDetail
//
//  Created by 구범모 on 2015. 10. 13..
//  Copyright © 2015년 gbmKSquare. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "detailSegue":
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            let cellTitle = "Cell \(selectedIndexPath.row)"
            
            let detailVC = segue.destinationViewController as! DetailViewController
            detailVC.cellTitle = cellTitle
        default: break
        }
    }
    
    // MARK: Table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        cell.cellTitleLabel.text = "Cell \(indexPath.row)"
        
        if let image = UIImage(named: "omg") {
            cell.dogImageView?.image = image
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

