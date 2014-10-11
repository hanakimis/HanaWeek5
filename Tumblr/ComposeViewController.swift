//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Hana Kim on 10/9/14.
//  Copyright (c) 2014 Hana. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController,  UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 60/255, green: 78/255, blue: 96/255, alpha: 0.9)
        initalizeButtonLocations()
    }
    
    func initalizeButtonLocations() {
        // finish locations 119, 258
        textButton.frame.origin.y  = 1700
        photoButton.frame.origin.y = 580
        quoteButton.frame.origin.y = 1180
        linkButton.frame.origin.y  = 4500
        chatButton.frame.origin.y  = 1180
        videoButton.frame.origin.y = 4700
    }

    @IBAction func onNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            println("animating on")

            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 1
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.textButton.frame.origin.y  = 119
                self.photoButton.frame.origin.y = 119
                self.quoteButton.frame.origin.y = 119
                self.linkButton.frame.origin.y  = 258
                self.chatButton.frame.origin.y  = 258
                self.videoButton.frame.origin.y = 258
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            println("animating off")
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.textButton.frame.origin.y  = -600
                self.photoButton.frame.origin.y = -800
                self.quoteButton.frame.origin.y = -550
                self.linkButton.frame.origin.y  = -300
                self.chatButton.frame.origin.y  = -200
                self.videoButton.frame.origin.y = -400

                }) { (finished: Bool) -> Void in
                    fromViewController.view.alpha = 0
                    self.initalizeButtonLocations()
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
