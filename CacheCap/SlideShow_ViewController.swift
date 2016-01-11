//
//  SlideShowViewController.swift
//  CacheCap
//
//  Created by David on 15/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit

class SlideShow__ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let background = CAGradientLayer().turquoiseColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)

    }
    
    //all six images are buttons and linked to this outlet
    @IBAction func selectImage(sender: AnyObject) {
        performSegueWithIdentifier("ShowImage", sender: sender as! UIButton)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let button = sender as! UIButton
        
//segue to PhotoViewController and parse image title to imageToShow and testToShow variables
        
        if segue.identifier == "ShowImage" {
            let vc = segue.destinationViewController as! PhotoViewController
            vc.imageToShow = button.titleLabel?.text
            vc.textToShow = button.titleLabel?.text
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
//change text box to labels.
//use button title to change image for full screen VC
//update gpx
// new files / changes = PhotoViewController, slideshow_viewcontroller


