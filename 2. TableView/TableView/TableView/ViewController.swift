//
//  ViewController.swift
//  TableView
//
//  Created by 구범모 on 2015. 7. 27..
//  Copyright (c) 2015년 gbmKSquare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let subjects = ["Artificial Intelligence", "Algorithms", "Data Structure", "Database"]
    let grades = ["A", "A+", "B+", "B"]
    let classrooms = ["601", "202", "205", "B104"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Information"
    }
    
    // MARK: Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Grades"
        case 1: return "Classrooms"
        default: return nil
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        let subject = subjects[indexPath.row]
        cell.textLabel?.text = subject
        
        switch indexPath.section {
        case 0:
            let grade = grades[indexPath.row]
            cell.detailTextLabel?.text = grade
        case 1:
            let classroom = classrooms[indexPath.row]
            cell.detailTextLabel?.text = classroom
        default: break
        }
        
        return cell
    }
    
    // MARK: Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

