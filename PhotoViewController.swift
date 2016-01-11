//
//  PhotoViewController.swift
//  CacheCap
//
//  Created by David Watts (i7623191) on 07/01/2016.
//  Copyright © 2016 David. All rights reserved.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageToShow: String!
    
    @IBOutlet weak var showText: UITextView!
    var textToShow: String!
    
    
//        {
//            
//            let lines = textToShow.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
//            return lines[0]
//            
//    }

//    var contents = [
//        (text: "This image was taken from HMS Westminster at the Bournemouth Air Festival.")
//        // BeachHuts "The beach hits along the undercliff between Bournemouth and Boscombe.  Taken on a group walk."
//    ]
//
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageToShow)
       // print(imageToShow)
       // print(textToShow)
       //check to see if image titles are being parsed to the variables
        
    showText.text = textToShow
        
    
        
        if showText.text == "AirShow" {
            
            showText.text = (text:"This image was taken from HMS Westminster at the Bournemouth Air Festival.")
            
        } else if showText.text == "BeachHuts" {
            
            showText.text = (text:"The beach huts along the undercliff between Bournemouth and Boscombe.  Taken on a group walk.")
        }
            else if showText.text == "DeckChair" {
            
            showText.text = (text:"A giant deckchair that was placed by Bournemouth pier.")
    }
            else if showText.text == "FireWorks" {
            
            showText.text = (text:"Fireworks by Bournemouth Pier")
    }
            else if showText.text == "Oceanarium" {
            
            showText.text = (text:"An image taken inside the Bournemouth Oceanarium. Showing what some of the fish see.")
    }
            else if showText.text == "Surf" {
            
            showText.text = (text:"This image shows the surf school by Boscombe pier.  Unfortunately it also shows the lack of surf.")
    }
    


        let background = CAGradientLayer().turquoiseColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    
    
    }
    
}