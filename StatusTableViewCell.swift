//
//  StatusTableViewCell.swift
//  Facts
//
//  Created by Soya Diaoune on 2/19/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var plusOneButton: UIButton!
    
    let buttonColor = UIColor(red:0.84, green:0.15, blue:0.52, alpha:1.0)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        plusOneButton.setTitleColor(.white, for: .normal)
        plusOneButton.backgroundColor = buttonColor
        plusOneButton.clipsToBounds = true
        plusOneButton.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
