//
//  UIColorExt.swift
//  littleWeather
//
//  Created by Mac on 15/5/11.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func clearColor() -> UIColor{
        return UIColor(red: 180/255, green: 210/255, blue: 125/255, alpha: 1)
    }
    
    class func cloudColor() -> UIColor{
        return UIColor(red: 100/255, green: 150/255, blue: 200/255, alpha: 1)
    }
    
    class func maiColor() -> UIColor{
        return UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
    }
    
    class func rainColor() -> UIColor{
        return UIColor(red: 40/255, green: 80/255, blue: 170/255, alpha: 1)
    }
    
    class func defaultColor() -> UIColor{
        return UIColor(red: 20/255, green: 200/255, blue: 180/255, alpha: 1)
    }
    
    
}