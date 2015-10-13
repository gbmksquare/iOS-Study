//
//  DetailViewController.swift
//  FuckingTableView
//
//  Created by 구범모 on 2015. 10. 6..
//  Copyright © 2015년 gbmKSquare. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var cellTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = cellTitle
    }
}
