//
//  ViewController.swift
//  WinterStudy3_GCD
//
//  Created by Mac on 2016. 1. 16..
//  Copyright © 2016년 TheJoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) { () -> Void in
            //Do something intensive
            
            //Network
            
            
            
            let mainQueue = dispatch_get_main_queue()
            dispatch_async(mainQueue,{ () -> Void in
                //Update UI
            })
        }
        
        
        //몇 초 뒤에 메인큐에서 function을 실행하라
        let afterSecond = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC * 3))
        dispatch_after(afterSecond, dispatch_get_main_queue()){() -> Void in
            
            //function
        }
        
    }

    


}

