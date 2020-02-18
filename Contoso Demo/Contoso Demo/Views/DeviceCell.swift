//
//  DeviceCell.swift
//  Contoso Demo
//
//  Created by Игорь on 18.0220..
//  Copyright © 2020 VT. All rights reserved.
//

import UIKit

class DeviceCell: UICollectionViewCell {
    
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var updateStatusButton: UIButton!
    
    var status: Bool {
        return Bool.random()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let st = status
        statusLabel.text = st ? "Online" : "Offline"
        statusLabel.backgroundColor = st ? #colorLiteral(red: 0.2666666667, green: 0.8588235294, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 1, green: 0.337254902, blue: 0.3764705882, alpha: 1)
    }
    
}
