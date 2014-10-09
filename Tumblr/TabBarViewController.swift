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
    
    var currentTab: Int!
    
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
        
        currentTab = homeTabButton.tag
        selectTab(currentTab)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func selectTab(tab: Int) {
        
        var frame = contentView.frame
        currentTab = tab
        
        
        
        // USE AN ARRAY!!!!
        switch tab {
        case 0:
            contentView.addSubview(homeViewController.view)
            homeViewController.view.frame = frame
            homeTabButton.selected = true
        case 1:
            contentView.addSubview(searchViewController.view)
            searchViewController.view.frame = frame
            searchTabButton.selected = true
        case 2:
            contentView.addSubview(composeViewController.view)
            composeViewController.view.frame = frame
            composeTabButton.selected = true
        case 3:
            contentView.addSubview(accountViewController.view)
            accountViewController.view.frame = frame
            accountTabButton.selected = true
        case 4:
            contentView.addSubview(trendingViewController.view)
            trendingViewController.view.frame = frame
            trendingTabButton.selected = true

        default:
            println("mysterr tabbutton tag: \(tab)")
        }
    }
    
    func unselectTab(tab: Int) {
        switch tab {
        case 0:
            contentView.addSubview(homeViewController.view)
            homeTabButton.selected = true
        case 1:
            contentView.addSubview(searchViewController.view)
            searchTabButton.selected = true
        case 2:
            contentView.addSubview(composeViewController.view)
            searchTabButton.selected = true
        case 3:
            contentView.addSubview(accountViewController.view)
        case 4:
            contentView.addSubview(trendingViewController.view)
        default:
            println("mysterr tabbutton tag: \(tab)")
        }
    }
    
    @IBAction func onTabBarButton(button: UIButton) {

        unselectTab(currentTab)
        selectTab(button.tag)
        
        
 
    }
    
}
