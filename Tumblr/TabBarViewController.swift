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
        
        switch button.tag {
        case 0:
            contentView.addSubview(homeViewController.view)
        case 1:
            contentView.addSubview(searchViewController.view)
        case 2:
            contentView.addSubview(composeViewController.view)
        case 3:
            contentView.addSubview(accountViewController.view)
        case 4:
            contentView.addSubview(trendingViewController.view)
        default:
            println("mysterr tabbutton tag: \(button.tag)")
        }
        
        
        //contentView.addSubview(vienwafsd)
    }

}
