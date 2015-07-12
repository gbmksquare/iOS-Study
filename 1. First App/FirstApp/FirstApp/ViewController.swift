//
//  ViewController.swift
//  FirstApp
//
//  Created by 구범모 on 2015. 7. 12..
//  Copyright (c) 2015년 gbmKSquare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViewFromCode()
        animateView()
        animateViewWtihSpring()
        createViewWithAutoLayout()
        
        addObserver()
        
//        createPatternWithView()
    }
    
    deinit {
        removeObserver()
    }
    
    func createViewFromCode() {
        // Create view
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.redColor()
        
        // Add view to super view
        self.view.addSubview(view)
    }
    
    func animateView() {
        // Create view
        let origin = CGPoint(x: 100, y: 0)
        let size = CGSize(width: 100, height: 100)
        let view = UIView(frame: CGRect(origin: origin, size: size))
        view.backgroundColor = UIColor.orangeColor()
        
        // Add view to super view
        self.view.addSubview(view)
        
        // Animation
        UIView.animateWithDuration(3, animations: { () -> Void in
            // Calculate new position
            let currentCenter = view.center
            let newCenter = CGPoint(x: currentCenter.x, y: currentCenter.y + 200)
            
            // Change position
            view.center = newCenter
        })
    }
    
    func animateViewWtihSpring() {
        // Create view
        let origin = CGPoint(x: 200, y: 0)
        let size = CGSize(width: 100, height: 100)
        let view = UIView(frame: CGRect(origin: origin, size: size))
        view.backgroundColor = UIColor.yellowColor()
        
        // Add view to super view
        self.view.addSubview(view)
        
        // Animation with spring
        UIView.animateWithDuration(3, delay: 0,
            usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                
                // Calculate new position
                let newFrame = CGRect(x: 200, y: 200, width: 100, height: 100)
                
                // Change position
                view.frame = newFrame
                
                // Change color
                view.backgroundColor = UIColor.greenColor()
                
        }) { (_) -> Void in
            println("Animation completed.")
        }
    }
    
    func createViewWithAutoLayout() {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.blueColor()
        self.view.addSubview(view)
        
        // Height
        let heightConstraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 50)
        
        // Bottom
        let bottomConstraint = NSLayoutConstraint(item: self.view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: 70)
        
        // Left
        let leftConsraint = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Left ,
            multiplier: 1,
            constant: 10)
        
        // Right
        let rightConstraint = NSLayoutConstraint(item: self.view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: 10)
        
        let constraints = [heightConstraint, bottomConstraint, leftConsraint, rightConstraint]
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraints(constraints)
    }
    
    // MARK: Send notification
    @IBAction func tappedSendNotificaitonButton(sender: UIButton) {
        let userInfo = ["name": "BumMo"]
        NSNotificationCenter.defaultCenter().postNotificationName("buttonNotif", object: self, userInfo: userInfo)
    }
    
    func addObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleNotification:", name: "buttonNotif", object: self)
    }
    
    func removeObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleNotification(notification: NSNotification) {
        let name = notification.userInfo?["name"] as? String
        if let name = name {
            println(name)
        }
    }
    
    // MARK: Pattern
    func createPatternWithView() {
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        let width: CGFloat = screenWidth / 20
        let height: CGFloat = screenHeight / 40
        
        let columnCount = Int(screenWidth / width)
        let rowCount = Int(screenHeight / height)
        
        for row in 0 ..< rowCount {
            for column in 0 ..< columnCount {
                let xPosition: CGFloat = width * CGFloat(column)
                let yPosition: CGFloat = height * CGFloat(row)
                
                let view = UIView(frame: CGRect(origin: CGPoint(x: xPosition, y: yPosition), size: CGSize(width: width, height: height)))
                self.view.addSubview(view)
                
                let color1 = UIColor.lightGrayColor()
                let color2 = UIColor.grayColor()
                if row % 2 == 0 {
                    view.backgroundColor = column % 2 == 0 ? color1 : color2
                } else {
                    view.backgroundColor = column % 2 == 0 ? color2 : color1
                }
            }
        }
    }
}

