//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Hana Kim on 10/9/14.
//  Copyright (c) 2014 Hana. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    var count: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.hidden = true
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImage.image = images
        count = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        println(count)
        delay(2) {
            self.scrollView.hidden = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
