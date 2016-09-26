//
//  SlideMenuItem.swift
//  SlideoutMenuSwift
//
//  Created by testio2k16 on 9/26/16.
//  Copyright © 2016 testio2k16. All rights reserved.
//

import UIKit

class SlideMenuItem: UITableViewCell {
    
    @IBOutlet var icon: UIImageView!
    
    @IBOutlet var label: UILabel!

    @IBOutlet var checked: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checked.hidden = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
