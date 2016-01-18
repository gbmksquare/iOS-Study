//
//  TableViewController.swift
//  homework3_Basic
//
//  Created by Mac on 2016. 1. 18..
//  Copyright © 2016년 TheJoa. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "하이류"  // 네비게이션 에서 타이틀
        
        setUpTableView()
        
        
        
    }
    
   
    
    
    func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self // 액션 일어났을때
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section+1)"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0 :
            return 10
            
        default :
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell
        cell.textLabel?.text = "cell \(indexPath.row+1)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        //
        guard let identifier = segue.identifier else {
            return
        }
        switch identifier {
        case "mySegue" :
            print("hi")
          //  let detailViewController = segue.destinationViewController as! DetailViewController
            
          //  detailViewController.tmp = "\(tableView.indexPathForSelectedRow!.row)"
            
        default: return
        }
        
        
    }

}
