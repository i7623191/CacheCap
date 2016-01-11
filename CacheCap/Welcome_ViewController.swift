//
//  Welcome_ViewController.swift
//  CacheCap
//
//  Created by David on 19/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import Foundation
import UIKit

class Welcome__ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let background = CAGradientLayer().turquoiseColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)

       
           
    }
}