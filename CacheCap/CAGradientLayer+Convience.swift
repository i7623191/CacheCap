//
//  CAGradientLayer+Convience.swift
//  CacheCap
//
//  Created by David on 19/12/2015.
//  Copyright © 2015 David. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func turquoiseColor() -> CAGradientLayer {
    
        let topColor = UIColor(red: (31/255.0), green: (122/255.0), blue: (77/255.0), alpha: 1)
    
        let bottomColor = UIColor(red: (115/255.0), green: (215/255.0), blue: (39/255.0), alpha: 1)
    
    let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
    let gradientLocations: [Float] = [0.0, 1.0]
    
    let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
    
    return gradientLayer
    }
}