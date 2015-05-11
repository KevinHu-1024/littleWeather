//
//  UITableViewCellExt.swift
//  littleWeather
//
//  Created by Mac on 15/5/11.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    func setBackgroundColorBy(weather:String) ->UITableViewCell{
        //对String提取最后一个字
        //对最后一个字进行swich，每种状况设置一个颜色，然后break，外面返回cellColor
        var cellColor = UIColor.defaultColor()
        if weather.isEmpty {
            println("cellIsEmpty")
        }else{
            switch weather[weather.endIndex.predecessor()] {
            case "晴":
                cellColor = UIColor.clearColor()
            case "云":
                cellColor = UIColor.cloudColor()
            case "霾":
                cellColor = UIColor.maiColor()
            case "雨":
                cellColor = UIColor.rainColor()
            default:
                cellColor = UIColor.defaultColor()
            }
        }
        self.backgroundColor = cellColor
        return self
}
}