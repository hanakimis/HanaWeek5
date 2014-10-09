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
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeTabButton.tag = 0
        searchTabButton.tag = 1
        composeTabButton.tag = 2
        accountTabButton.tag = 3
        trendingTabButton.tag = 4
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func onTabBarButton(button: UIButton) {
        var frame = contentView.frame
        
        switch button.tag {
        case 0:
            contentView.addSubview(homeViewController.view)
            homeViewController.view.frame = frame
        case 1:
            contentView.addSubview(searchViewController.view)
            searchViewController.view.frame = frame
        case 2:
            contentView.addSubview(composeViewController.view)
            composeViewController.view.frame = frame
        case 3:
            contentView.addSubview(accountViewController.view)
            accountViewController.view.frame = frame
        case 4:
            contentView.addSubview(trendingViewController.view)
            trendingViewController.view.frame = frame
        default:
            println("mysterr tabbutton tag: \(button.tag)")
        }
    }
    
}
