//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Hana Kim on 10/9/14.
//  Copyright (c) 2014 Hana. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var homeTabButton: UIButton!
    @IBOutlet weak var searchTabButton: UIButton!
    @IBOutlet weak var composeTabButton: UIButton!
    @IBOutlet weak var accountTabButton: UIButton!
    @IBOutlet weak var trendingTabButton: UIButton!
    @IBOutlet weak var explorePopoverImage: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var tabButtons = [UIButton]()
    var tabViewControllers = [UIViewController]()
    var currentTab: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeTabButton.tag     = 0
        searchTabButton.tag   = 1
        accountTabButton.tag  = 2
        trendingTabButton.tag = 3
        tabButtons.append(homeTabButton)
        tabButtons.append(searchTabButton)
        tabButtons.append(accountTabButton)
        tabButtons.append(trendingTabButton)
        
        homeViewController     = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController   = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController  = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        tabViewControllers.append(homeViewController)
        tabViewControllers.append(searchViewController)
        tabViewControllers.append(accountViewController)
        tabViewControllers.append(trendingViewController)
        
        currentTab = homeTabButton.tag
        selectTab(currentTab)
        
        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.explorePopoverImage.frame.origin.y = 465
            }) { (finished: Bool) -> Void in
        }
    }
    
    @IBAction func onTabBarButton(button: UIButton) {
        unselectTab(currentTab)
        selectTab(button.tag)
    }
    
    func selectTab(tab: Int) {
        var frame = contentView.frame
        currentTab = tab
        
        self.addChildViewController(tabViewControllers[tab])
        contentView.addSubview(tabViewControllers[tab].view)
        tabViewControllers[tab].view.frame = frame
        tabViewControllers[tab].didMoveToParentViewController(self)
        tabButtons[tab].selected = true
        
        if (tabButtons[tab].tag == 1) {
            explorePopoverImage.hidden = true
        } else {
            explorePopoverImage.hidden = false
        }
    }
    
    func unselectTab(tab: Int) {
        tabButtons[tab].selected = false
        tabViewControllers[tab].view.removeFromSuperview()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as ComposeViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
