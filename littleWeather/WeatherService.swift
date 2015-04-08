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

struct WeatherInfo {
    var city: String
    var cityID: String
    var  weather: String
    var temp: String
}

class WeatherService: NSObject {
    
//    let locationService = LocationService()
    let locationService = LocationService() //以后要只放在天气服务中

    
    func test (){
        locationService.on()

//        var str: String = axis ["longitude"]!
//        println( str )
        
    }
}
