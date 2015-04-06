//
//  MainTableViewCell.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    
//    @IBOutlet weak var backImg : UIImage?
    @IBOutlet weak var city : UILabel?
    @IBOutlet weak var temp: UILabel?
    @IBOutlet weak var  weather: UILabel?
    @IBOutlet weak var day: UILabel?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
