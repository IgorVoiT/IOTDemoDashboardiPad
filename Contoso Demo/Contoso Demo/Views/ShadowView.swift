//
//  ShadowView.swift
//  Contoso Demo
//
//  Created by Игорь on 18.0220..
//  Copyright © 2020 VT. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    private func setupShadow() {
        layer.cornerRadius = 15.0
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.1
        layer.shadowPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: layer.cornerRadius, height: layer.cornerRadius)).cgPath
        layer.shouldRasterize = true
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
    }

}
