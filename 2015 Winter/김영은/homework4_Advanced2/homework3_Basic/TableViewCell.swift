//
//  TableViewCell.swift
//  homework3_Basic
//
//  Created by Mac on 2016. 1. 20..
//  Copyright © 2016년 TheJoa. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    var thumnailUrl : String!
    var identifier : String!
    var id : Int = 0
    
    var downloadedImage: UIImage!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.contentMode = .ScaleAspectFit
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    /*
    
    func populateCell(url: String){
        
        let checkedUrlString = url.stringByReplacingOccurrencesOfString("http://", withString: "https://")
            
        if let checkedUrl = NSURL(string: checkedUrlString ){
                            getDataFromUrl(checkedUrl) { (data, response, error)  in
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    guard let data = data where error == nil else { return }
                    //print("Download Finished")
                    
                    if url == self.identifier {
                        self.thumbnailImageView.image =  UIImage(data: data)
                        //self.downloadedImage = UIImage(data: data)!
                    }

                    
                }
            }
        }
       // thumbnailImageView.image = downloadedImage
            
        
        
        
        
        
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */

}
