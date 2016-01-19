//
//  TableViewController.swift
//  homework3_Basic
//
//  Created by Mac on 2016. 1. 18..
//  Copyright © 2016년 TheJoa. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class TableViewController: UITableViewController {

    struct Photo {
        var id : Int
        var title : String
        var thumbnailUrl : String
        var url : String
        
    }
    var myPhoto = [Photo]()
    
    
    let networkActivityManager = NetworkActivityManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "하이류"  // 네비게이션 에서 타이틀
        
        
        setUpTableView()
        loadinitialPhotos()
        
       // self.refreshControl?.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
    
        /*
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) { () -> Void in
            //Do something intensive
            
            let mainQueue = dispatch_get_main_queue()
            dispatch_async(mainQueue,{ () -> Void in
                //Update UI
                
            })
        }
        */
       // requestAndResponseHandling()
       
    }
    func handleRefresh(refreshControl: UIRefreshControl) {
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
   
    func  requestAndResponseHandling(cellNum : Int){
        let postEndpoint: String = "http://jsonplaceholder.typicode.com/photos/\(cellNum)"
        
        //Count
        self.networkActivityManager.increaseNetworkCount()
        
        
        Alamofire.request(.GET, postEndpoint)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /photos/\(cellNum)")
                    print(response.result.error!)
                    self.networkActivityManager.decreaseNetworkCount()
                    return
                }
                
                if let value: AnyObject = response.result.value {
                    
                    
                    
                    
                    let post = JSON(value)
                    // now we have the results, let's just print them though a tableview would definitely be better UI:
                    print("The post is: " + post.description)
                    
                    let tmpPhoto = Photo(
                        id : post["id"].int!,
                        title: post["title"].string!,
                        thumbnailUrl: post["thumbnailUrl"].string!,
                        url: post["url"].string!)
                    
                    self.myPhoto.append(tmpPhoto)
                    if self.myPhoto.count > 0 {
                        self.tableView.reloadData()
                    }
                    self.networkActivityManager.decreaseNetworkCount()
                    
                }
        }
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
            return myPhoto.count
            
        default :
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell
        
        cell.textLabel?.text = myPhoto[indexPath.row].title
        return cell
    }
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        if networkActivityManager.networkCount == 0 && (maximumOffset - contentOffset < -60 ){
            print("loadMorePhotos() called")
            loadMorePhotos()
        }
        
        /*
        if !isLoadingMore && (maximumOffset - contentOffset <= threshold) {
            // Get more data - API call
            self.isLoadingMore = true
        
            // Update UI
            dispatch_async(dispatch_get_main_queue()) {
                tableView.reloadData()
                self.isLoadingMore = false
            }
        }
*/
    }
    
    func loadinitialPhotos(){
        
        let start = 1
        let end = 11
        for i in start..<end {
            requestAndResponseHandling(i)
        }
    }
    
    
    func loadMorePhotos(){
        
        let start = myPhoto.count + 1
        let end = myPhoto.count + 6
        for i in start..<end {
            requestAndResponseHandling(i)
        }
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
class NetworkActivityManager {
    var networkCount: Int = 0 {
        willSet(newValue) {
            if newValue > 0 {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            } else {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
            }
        }
        didSet {
            
        }
    }
    
    func increaseNetworkCount() {
        
        networkCount++
        print(networkCount)
    }
    
    func decreaseNetworkCount(){
        networkCount--
        print(networkCount)
    }
}