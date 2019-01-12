//
//  GradientView.swift
//  Psychic Tester
//
//  Created by Evgeniy Ryshkov on 12/01/2019.
//  Copyright © 2019 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class GradientView: UIView {

    @IBInspectable var topColor = UIColor.white
    @IBInspectable var bottomColor = UIColor.black
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }

}
