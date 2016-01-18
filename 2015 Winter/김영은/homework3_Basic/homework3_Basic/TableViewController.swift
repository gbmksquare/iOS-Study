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
        
        init(id : Int, title: String, thumbnailUrl: String, url: String) {
            self.id = id
            self.title = title
            self.thumbnailUrl = thumbnailUrl
            self.url = url
        }
    }
    var myPhoto = [Photo]()
    var jsonArray:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "하이류"  // 네비게이션 에서 타이틀
        
        
        setUpTableView()
        requestAndResponseHandling()
        
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
    
   
    func  requestAndResponseHandling()/*(cellNum : Int) -> Photo */{
        //var tmpPhoto : Photo = Photo.init(id: 0 ,title: "",thumbnailUrl: "",url: "")
        let postEndpoint: String = "http://jsonplaceholder.typicode.com/photos/1"
        Alamofire.request(.GET, postEndpoint)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /photos/1")
                    print(response.result.error!)
                    return
                }
                
                if let value: AnyObject = response.result.value {
                    // handle the results as JSON, without a bunch of nested if loops
                    let post = JSON(value)
                    // now we have the results, let's just print them though a tableview would definitely be better UI:
                    print("The post is: " + post.description)
                    
                    //tmpPhoto = Photo(id : post["id"].int!, title: post["title"].string!, thumbnailUrl: post["thumbnailUrl"].string!, url: post["url"].string!)
                    
                    
                    if let title = post["title"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print("error parsing /photos/1")
                    }
                }
        }
    //    return tmpPhoto
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
        
        //cell.textLabel?.text = "cell \(indexPath.row+1)"
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
