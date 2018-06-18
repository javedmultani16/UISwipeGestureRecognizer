//
//  ViewController.swift
//  UISwipeGestureRecognizer
//
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 var swipeGesture = UISwipeGestureRecognizer()
    @IBOutlet weak var viewSwipe: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let direction: [UISwipeGestureRecognizerDirection] = [.up, .down, .left, .right]
        for dir in direction{
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeView(_:)))
            viewSwipe.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = dir
            viewSwipe.isUserInteractionEnabled = true
            viewSwipe.isMultipleTouchEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func swipeView(_ sender:UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .right{
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: self.viewSwipe.frame.origin.y, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }else if sender.direction == .left{
                self.viewSwipe.frame = CGRect(x: 0, y: self.viewSwipe.frame.origin.y, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }else if sender.direction == .up{
                 self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: 0, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }else if sender.direction == .down{
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: self.view.frame.size.height - self.viewSwipe.frame.size.height, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }
        }
    }

}

