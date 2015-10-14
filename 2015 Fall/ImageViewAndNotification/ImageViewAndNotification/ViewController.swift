//
//  ViewController.swift
//  ImageViewAndNotification
//
//  Created by 구범모 on 2015. 10. 14..
//  Copyright © 2015년 gbmKSquare. All rights reserved.
//

import UIKit

let SomethingHanppenedNotification = "kSomethingHanppenedNotification"

class ViewController: UIViewController {
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defer {
            addNotificationObserver()
        }
        
        guard let image = UIImage(named: "Apple") else { return }
        
        setupTopImageView(image)
        setupMiddleImageView(image)
        setupBottomImageView(image)
    }
    
    deinit {
        removeNotificationObserver()
    }
    
    // MARK: Action
    @IBAction func tappedButton(sender: UIButton) {
        sendNotification()
    }
    
    // MARK: Image
    private func setupTopImageView(image: UIImage) {
        topImageView.image = image
        
        topImageView.clipsToBounds = true
        topImageView.contentMode = .ScaleToFill
    }
    
    private func setupMiddleImageView(image: UIImage) {
        middleImageView.image = image
        
        middleImageView.clipsToBounds = true
        middleImageView.contentMode = .ScaleAspectFit
    }
    
    private func setupBottomImageView(image: UIImage) {
        bottomImageView.image = image
        
        bottomImageView.clipsToBounds = true
        bottomImageView.contentMode = .ScaleAspectFill
    }
    
    // MARK: Notification
    private func addNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleNotification:", name: SomethingHanppenedNotification, object: self)
    }
    
    private func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private func sendNotification() {
        NSNotificationCenter.defaultCenter().postNotificationName(SomethingHanppenedNotification, object: self)
    }
    
    @objc private func handleNotification(notification: NSNotification) {
        let alertController = UIAlertController(title: "Wow", message: "Something just happened!", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}

