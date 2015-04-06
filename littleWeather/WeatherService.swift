//
//  WeatherService.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import Foundation
import Alamofire
import swiftyJSON

//WeatherService 接收来自LocationService 的经纬度信息，经由网络服务获得天气信息，解析并存入一个结构体


class WeatherService: NSObject {
    
    let locationService = LocationService()
    
    func test (){
        
        var str: String = axis ["longitude"]!
        println( str )
        
    }
}
